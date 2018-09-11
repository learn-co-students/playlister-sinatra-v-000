class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs' do
    binding.pry
    @song = Song.create(name: params[:song_name])
    if !params[:artist_name].empty?
      @song.artist = Artist.create(name: params[:artist_name])
    end
    @song.genres << Genre.all.find_by(id: params[:genres])
    @song.save
    redirect to "songs/#{@song.slug}"
  end

  get '/songs/:id' do
    @song = Song.find_by_slug(params[:id])
    erb :'/songs/show'
  end

  get '/songs/:id/edit' do
  end

  patch '/songs/:id' do
  end

  put '/songs/:id' do
  end

  delete '/songs/:id' do
  end
end
