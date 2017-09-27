require 'pry'
class ApplicationController < Sinatra::Base

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs/new' do

     if params["artist"]["name"] != ""
       if Artist.find_by_name(params["artist"]["name"]) != nil
         @artist = Artist.find_by_name(params["artist"]["name"])
       else
         @artist = Artist.create(name: params["artist"]["name"])
       end
         @song = Song.create(name: params["Name"], artist_id: @artist.id)
         @genre = params["song"]["genre_id"]
         SongGenre.create(song_id: @song.id, genre_id: @genre)
     else
       @artist = Artist.find(params["song"]["artist_id"])
       @song = Song.create(name: params["Name"], artist_id: @artist.id)
       @genre = params["song"]["genre_id"]
       SongGenre.create(song_id: @song.id, genre_id: @genre)
     end
     session[:success] = "Successfully created song."
     redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find(@song.artist_id)
    @genres = []
     SongGenre.all.each do |sg|
       if @song.id == sg.song_id
          @genres << Genre.find(sg.genre_id)
          sg.delete
       end
     end
         erb :'/songs/edit'
  end

  post '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find(@song.artist_id)
    @artist.name = params["artist"]["name"]
    @artist.save
    params["song"]["genre_ids"].each do |genre|
        SongGenre.create(song_id: @song.id, genre_id: genre)
    end

     redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find(@song.artist_id)
    @genres = []
    SongGenre.all.each do |sg|
      if @song.id == sg.song_id
         @genres << Genre.find(sg.genre_id)
      end
     end

    erb :'/songs/show'
  end

end
