class SongsController < ApplicationController
enable :sessions

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  post '/songs' do
    @song = Song.create(params[:name])
    flash[:message] = "Successfully created song."
    redirect to("/songs/#{@song.slug}")
  end


end
