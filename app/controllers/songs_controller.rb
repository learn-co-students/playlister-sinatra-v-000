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
    @song = Song.create(name: params[:name], artist_id: params[:artist_id])
    # @genres = params[:genres]
    redirect to "/songs/#{put song slug here}"
  end
end
