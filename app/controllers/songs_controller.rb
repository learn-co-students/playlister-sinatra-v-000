class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end


  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    #binding.pry
    erb :'/songs/show'
  end


  post '/songs' do
    @song = Song.create(:name => params["Name"])
    #binding.pry
    @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
    #binding.pry
    @song.genre_ids = params[:genres]
    @song.save

    #binding.pry
    redirect to "songs/#{@song.slug}"
  end


end
