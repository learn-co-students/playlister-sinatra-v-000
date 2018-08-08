class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs/:slug' do
    @artist = Artist.create(name: params["song"]["artist"]["name"])
    @song = Song.create(name: params[:song][:name], artist_id: artist.id)
    redirect to("/songs/#{song.slug}")
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

end
