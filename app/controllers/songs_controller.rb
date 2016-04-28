class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end
 
  get '/songs/:slug' do 
    @song = Song.find_by_slug(params["slug"])
    @artist = Artist.find(@song.artist_id)
    @song_genres = []
    SongGenre.all.each do |sg| 
      if sg.song_id == @song.id
        g = Genre.find(sg.genre_id)
        @song_genres << g 
      end 
      @song_genres
    end
    erb :'songs/show'
  end
 
  post '/songs' do
    if params["song"]["artist_id"]
      @song = Song.new(name: params["song"]["name"])
      @artist = Artist.find(params["song"]["artist_id"])
      @song.artist_id = @artist.id
      @song.save
      Genre.find(params["genres"]).each { |genre| song.genres << genre }
      
      @song.save
    end
    erb :"/songs", locals: {message: "Successfully created song."}
  end
 
  get '/songs/:slug/edit' do 
    @song = Song.find_by_slug(params["slug"])
    erb :'/songs/edit'
  end
 
  patch '/songs/:slug' do 
    @song = Song.find_by_slug(params["slug"])
     # binding.pry
    if !params["artist_name"].empty?
      @artist = Artist.create(params[:artist])
      # binding.pry
      @song.artist_id = @artist.id
      end
    if !params["genre_name"].empty?
      @genre = Genre.find_by(name: params["existing_genre_name"])
      @song_genre = SongGenre.create(song_id: @song.id, genre_id: @genre.id)
      @song.save
      end
    @song.save
    erb :'songs/show', locals: {message: "Song successfully updated."}
  end
 
end