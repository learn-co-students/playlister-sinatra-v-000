class SongsController < ApplicationController


get '/songs' do
   erb :song_list
 end

 get '/songs/:slug' do
     if params[:slug] == "new"
       erb :new_song
     else
       @song = Song.find_by_slug(params[:slug])
       erb :show_song
     end
   end

   post '/songs/new' do
    @song = Song.find_by(name: params[:Name])
    if @song == nil
      @song = Song.create(name: params[:Name])
    end

    @artist = Artist.find_by(name: params["Artist Name"])
    if @artist != nil
      @song.artist = @artist
    else
      @artist = Artist.create(name: params["Artist Name"])
      @song.artist = @artist
    end

    params[:genres].each do |a|
      SongGenre.create(genre_id: a, song_id: @song.id)
    end

    erb :created_song
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :edit_song
  end

  post '/songs/:slug/edit' do
    @song = Song.find_by(name: params[:Name])
    @song.name = params[:Name]

    @artist = Artist.find_by(name: params["Artist Name"])
    if @artist != nil
      @song.artist = @artist
    else
      @artist = Artist.create(name: params["Artist Name"])
      @song.artist = @artist
    end

    params[:genres].each do |a|
      SongGenre.create(genre_id: a, song_id: @song.id)
    end

    erb :updated_song

  end




end
