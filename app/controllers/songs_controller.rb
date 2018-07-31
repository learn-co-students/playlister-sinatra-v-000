class SongsController < ApplicationController

  get '/songs' do
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end


    post '/songs' do
       @song = Song.create(name: params[:Name])
       @song.artist = Artist.find_by_or_create_by(name: params["Artist Name"])

        @songgenre = SongGenre.create(song_id: @song.id, genre_id: params[:genres][0].to_i)
        @genre = Genre.find_by_id(@songgenre.genre_id)
       redirect to "/songs/#{@song.slug}"
     end

     get '/songs/:slug' do
       @song = Song.find_by_slug(params[:slug])
       @artist = Artist.find_by_id(@song.artist_id)
   #binding.pry
       @songgenre = SongGenre.find_by_song_id(@song.id)
       @genre = Genre.find_by_id(@songgenre.genre_id)
       erb :'songs/show'
     end






end
