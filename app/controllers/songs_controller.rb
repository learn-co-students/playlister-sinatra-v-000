class SongsController < ApplicationController


  get '/songs' do
    @songs = Song.all
    erb :'/song/index'
  end

  get '/songs/new' do
    erb :'/song/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/song/show'
  end

  post '/songs' do
    @new_song = Song.create(name: "song_name")
    if Artist.find_by_name(params[:"Artist Name"])
      @new_song.artist = Artist.find_by_name(params[:"Artist Name"])
    else
      @new_artist = Artist.create(name: params[:"Artist Name"])
      @new_song.artist = @new_artist
    end

    @new_song.name = params[:"Name"]
    params[:genres].each do |genre|
      @new_song.genres << Genre.find(genre)
    end
    @new_song.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@new_song.slug}"
  end

  get '/songs/:slug/edit' do

  end

end
