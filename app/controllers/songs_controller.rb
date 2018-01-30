class SongsController < ApplicationController

  post '/songs' do
    @song = Song.new(name: params["Name"]  )#, genre_ids: params["genres"]
    # if params["Artist Name"] != "" || params["Artist Name"] != nil 
      @song.artist = Artist.find_or_create_by(name: params["Artist Name"])    
    # end
    @song.save
    redirect '/songs'
  end

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @songs = Song
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    #  binding.pry
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

end