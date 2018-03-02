class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(name: params["Name"])
    if !params["Artist Name"].empty?
      @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    end
    if !params["genres"]
      @song.genre_ids = params["genres"]
    end
    @song.save
    redirects to('/songs/:slug')
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end
end
