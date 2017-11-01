class SongsController < ApplicationController

  get '/songs' do
    # binding.pry
    @songs = Song.all
    erb :'./songs/index'
  end

  get '/songs/new' do
    binding.pry
    erb :'./songs/new'
  end

  post '/songs/new' do
    # redirect to "./songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @genres = @song.genres
    # binding.pry
    erb :'./songs/show'
  end

end
