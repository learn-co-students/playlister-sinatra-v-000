class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    #binding.pry
    @songs = Song.all

    erb :'/songs/index'
  end


  get '/songs/new' do
    @genres = Genre.all

    erb :'/songs/new'
  end


  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist


    erb :'/songs/show'
  end


  post '/songs' do
    #binding.pry
    @song = Song.create(name: params[:Name])

    if Artist.find_by(name: params["Artist Name"]) == nil
      @artist = Artist.create(name: params["Artist Name"])
      @artist.save
    else
      @artist = Artist.find_by(name: params["Artist Name"])
    end

    @song.artist = @artist

    if !params[:genres].empty?
      params[:genres].each do |genre_id|
        @song.genres << Genre.find_by(id: genre_id)
      end
    end

    @song.save

    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    binding.pry
    @song.artist.update(name: params["Artist Name"])

    if !!params[:genres]
      @song.genres.clear
      binding.pry
      params[:genres].each do |genre_id|
        @song.genres << Genre.find_by(id: genre_id)
      end
    end
    binding.pry

    flash[:message] = "Successfully updated song."
    binding.pry
    redirect to :"/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    binding.pry
    erb :'/songs/edit'
  end


end
