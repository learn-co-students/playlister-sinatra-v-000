class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  post '/songs' do
    @song = Song.create(name: params[:song_name])
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.genre_ids = params[:genres]
    binding.pry
    @song.save

    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

end
