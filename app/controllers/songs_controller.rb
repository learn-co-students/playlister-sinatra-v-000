class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    binding.pry
    @genres = Genre.all
    erb :'/songs/new'
  end

    get '/songs/:slug' do
      @song = Song.find_by_slug(params[:slug])
      erb :'/songs/show'
    end

    post '/songs' do
      if !params["owner"]["name"].empty?
      @song.artist = Song.create(name: params["song"]["name"])
    end
      @song.save
      redirect '/songs/:slug'
    end

end
