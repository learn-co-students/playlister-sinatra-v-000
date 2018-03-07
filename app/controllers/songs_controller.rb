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
    @song = Song.create(name: params[:Name])
    if !params[:artist].empty?
      @artist = Artist.create(name: params[:artist])
      @artist.save
      @song.artist = @artist
    else
      @artist = Artist.find_by_slug(params[:artist_slug])
      @song.artist = @artist
    end

    #binding.pry
    binding.pry
    if !params[:genre_name].empty?
      @genre = Genre.create(name: params[:genre_name])
      binding.pry
      @genre.save
    else
      @genre = Genre.find_by_slug(params[:genre_slug])
    end

    # @song.genre
    @song.save
    #binding.pry
    # @genres = params[:genres]
    redirect to "/songs/#{@song.slug}"
  end
end
