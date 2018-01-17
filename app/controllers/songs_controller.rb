class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
   @song = Song.new(name:params[:Name])
   @song.artist = Artist.find_or_create_by(name:params["Artist Name"])
   @song.genre_ids = params[:genres]
   @song.save
   redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @messages = ["Successfully created song.", "Successfully updated song."]
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.name = params[:Name]
    @song.artist = Artist.find_or_create_by(name:params["Artist Name"])
    @song.genre_ids = params[:genres]
    @song.save
    redirect "/songs/#{@song.slug}"
  end



end
