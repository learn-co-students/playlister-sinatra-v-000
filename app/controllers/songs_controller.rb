class SongsController < ApplicationController

  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(name: params["Name"])
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.genre_ids = params[:genres]
    @song.save

    flash[:message] = "Successfully created song."
    redirect to("songs/#{@song.slug}")
  end

  get '/songs/:id' do
    @song = Song.find_by_slug(params[:id])
    erb :'/songs/show'
  end

  get '/songs/:id/edit' do
    @song = Song.find_by_slug(params[:id])
    erb :'/songs/edit'
  end

  patch '/songs/:id' do
    @song = Song.find_by_slug(params[:id])
    @song.update(name: params["Name"])
    @song.genre_ids = params["genres"]
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to("songs/#{@song.slug}")
  end

  put '/songs/:id' do
  end

  delete '/songs/:id' do
  end
end
