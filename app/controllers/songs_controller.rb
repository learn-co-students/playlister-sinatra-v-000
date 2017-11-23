require 'rack-flash'
class SongsController < ApplicationController

  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @artists = Artist.all
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do
   @song = Song.create(name: params["name"])
   @artist_name = Artist.find_by(name: params["artist_name"])
    if @artist_name == nil
      @song.artist = Artist.create(name: params["artist_name"])
    else
      @song.artist = @artist_name
    end
   @genre_name = Genre.find(params["genres"])
   @song.genres << @genre_name
   @song.save
   flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.all.find{ |song| song.slug == params["slug"]}

    erb :'/songs/edit'
  end

  post '/songs/edit' do
    @song = Song.all.find{ |song| song.name == params["song"]["name"]}
    @song.name = params["song"]["name"]

    if @artist = Artist.find_by(name: params["artist"])
      @song.artist_id = @artist.id
    else
      @artist = Artist.create(name: params["artist"])
      @song.artist_id = @artist.id
    end

    params["genres"].each do |g|
        if !@song.genres.find_by(name: g)
      genre = Genre.find_by(name: g)

      @songs_genre = SongGenre.create
      @songs_genre.genre_id = genre.id
      @songs_genre.song_id = @song.id
      @songs_genre.save
    end
    end
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end
end
