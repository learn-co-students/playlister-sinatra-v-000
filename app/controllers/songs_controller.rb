class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :"/songs/index"
  end

  get '/songs/new' do
    erb :"songs/new"
  end

  post '/songs' do
    if !Song.find_by_name(params["Name"])
      Song.create(name: params["Name"])
      Artist.create(name: params["Artist Name"])
    end
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :"/songs/show"
  end

end
