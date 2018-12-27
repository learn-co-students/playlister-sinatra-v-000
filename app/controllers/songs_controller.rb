class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/song/index'
  end

  get '/songs/new' do
    @new_song = Song.create(name: "song_name")
    erb :'/song/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/song/show'
  end

  post '/songs/:slug' do
    @new_song = Song.find_by_slug(params[:slug])
    binding.pry
    if params[:"Artist Name"] == nil
      @new_artist = Artist.create(name: params[:"Artist Name"])
      @new_song.artist = @new_artist
    else
      @new_song.artist = Artist.find_by_slug(@new_song.artist.slug)
    end

    @new_song.name = params[:"Name"]
    @new_song.genre_id = params[:genres]
    @new_song.save

    redirect to '/songs/:slug'
  end

  get '/songs/:slug/edit' do

  end

end
