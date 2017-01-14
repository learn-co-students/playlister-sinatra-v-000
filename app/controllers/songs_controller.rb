class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all

    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do
    #binding.pry
    @song = Song.create(name: params["Name"])
    if !Artist.find_by(name: params["Artist Name"])
      @song.artist = Artist.create(name: params["Artist Name"])
    else
      @song.artist = Artist.find_by(params["Artist Name"])
    end
      @song.genres << Genre.find_by_id(params["genres"])
      @song.save
      #binding.pry
    redirect to "/songs/#{@song.slug}"
  end
end
