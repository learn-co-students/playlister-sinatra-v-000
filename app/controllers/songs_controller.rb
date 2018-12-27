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
    if Artist.find_by_name(params[:"Artist Name"])
      @new_song.artist = Artist.find_by_slug(@new_song.artist.slug)
    else
      @new_artist = Artist.create(name: params[:"Artist Name"])
      @new_song.artist = @new_artist
    end
    binding.pry
    @new_song.name = params[:"Name"]
    params[:genres].each do |genre|
      @new_song.genres << Genre.find(genre)
    end
    @new_song.save
    redirect to "/songs/#{@new_song.slug}"
  end

  get '/songs/:slug/edit' do

  end

end
