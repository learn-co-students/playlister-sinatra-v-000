class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  post '/songs/new' do
    #artist = Artist.create(params[:song][:artist])
    #song = Song.create(artist: artist, name: params[:song][:name])
    song = Song.create(params[:song])

    binding.pry
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end


end
