class SongsController < ApplicationController

  get '/' do
    erb :index
  end

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    #need to turn the slug into an id
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do
    #not sure if the below is correct
    @song = Song.create(name: params[:song_name])
    @artists = Artist.all
    @genres = Genre.all
    if !params[:artist_name].empty?
      @artist = Artist.create(name: params[:artist_name])
      @artist.save
    else
      @artist = Artist.find_by_slug(params[:artist_slug])
    end

    if !params[:genre_name].empty?
      @genre = Genre.create(name: params[:genre_name])
      @genre.save
    else
      @genre = Genre.find_by_slug(params[:genre_slug])
    end

    @song.artist = @artist
    # @song.genre
    @song.save
    # @genres = params[:genres]
    redirect to "/songs/#{@song.slug}"
  end
end
