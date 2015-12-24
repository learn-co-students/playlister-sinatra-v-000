class SongsController < ApplicationController
  
  #index
  get '/songs' do 
    @songs = Song.all
    erb :"songs/index"
  end

  #new
  get '/songs/new' do
    erb :'songs/new'
  end

  post '/songs/new' do
    @song = Song.first_or_create(name: params["Name"], artist: params["Artist Name"], genre: params["genre"])
    redirect to 'songs/:slug'

  end

#show
  get '/songs/:slug' do 
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end


  #edit
  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug]) #KEEP- makes 2 tests pass
    erb :'songs/edit'
  end

  post '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(name: params["Name"], artist: params["Artist Name"], genre: params["genre"])

    redirect to 'songs/:slug'

  end



end

