class SongsController < ApplicationController

  get '/songs/new' do
    erb :'songs/new'
  end

  post '/songs' do
    @song = Song.create(params[:song])

    # @song.artist = Artist.find_or_create_by(params[:artist])
    raise params.inspect
    @song.artist = Artist.create(params[:artist])
    # raise params.inspect
    @song.genre_ids = params[:genres]
    @song.save
    redirect "/songs/#{@song.slug}"
  end

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    # raise params.inspect
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

end
