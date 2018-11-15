class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs' do
    @artist = Artist.create(name: params[:songs][:artist][:name])
    @song = Song.create(name: params[:songs][:name], artist: @artist)
    params[:songs][:genres].each do |genre|
      @song.genres << Genre.find(genre)
    end

    redirect :"/songs/#{@song.id}"
  end

  get '/songs/:slug' do
    @song = Song.find(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find(params[:slug])
    @genres = Genre.all
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    raise params.inspect
    binding.pry
    redirect :"/songs/#{params[:slug]}"
  end

end
