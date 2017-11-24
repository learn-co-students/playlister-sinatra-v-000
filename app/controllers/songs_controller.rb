class SongsController < ApplicationController

  get '/songs' do
    @songs = Songs.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(params[:song])
    # look up artist by name
    # set song.artist
    # add each genre to song.genres
    @song.save
    flash[:message] = "Successfully created song."
    redirect to "songs/#{@song.stub}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params["song"])
    # look up artist by name
    # set song.artist
    # add each genre to song.genres
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end
end
