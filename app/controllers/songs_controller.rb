require 'rack-flash'
class SongsController < ApplicationController
  "songs controller"

    use Rack::Flash

  get '/songs' do
    #binding.pry
    erb :'/songs/index'
  end

  get '/songs/new'do
    erb :"/songs/new"
  end

  post '/songs' do
    @song = Song.create(params[:song])

      if @artist = Artist.find_by(name: params["artist"])
        @song.artist_id = @artist.id
      else
        @artist = Artist.create(name: params["artist"])
        @song.artist_id = @artist.id
      end

      params["genres"].each do |g| test = g.to_s
        genre = Genre.find_by(name: test)
        #binding.pry
        @songs_genre = SongGenre.create
        @songs_genre.genre_id = genre.id
        @songs_genre.song_id = @song.id
        @songs_genre.save
      end

    @song.save
    #binding.pry
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"

  end

  get '/songs/:slug' do

  #@song = Song.find_by(name: params["slug"].gsub('-', ' ').titleize)
  @song = Song.all.find{ |song| song.slug == params["slug"]}
  #binding.pry
    erb :'/songs/show'
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
        #binding.pry
        if !@song.genres.find_by(name: g)
      genre = Genre.find_by(name: g)

      @songs_genre = SongGenre.create
      @songs_genre.genre_id = genre.id
      @songs_genre.song_id = @song.id
      @songs_genre.save
    end
    end
    #binding.pry
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end


end
