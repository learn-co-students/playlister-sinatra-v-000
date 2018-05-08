class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all

    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do
    binding.pry
    @artist = Artist.create(params[:song][:artist])
    @song = Song.create(name: params[:song][:name], artist: @artist)
    @genres_ids = params[:song][:genres].collect {|i| i.to_i}
    @song.genres << Genre.find_by_id(@genres_ids.first)
     redirect to '/songs'
  end


end
