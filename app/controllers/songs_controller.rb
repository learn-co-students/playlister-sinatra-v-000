 require "rack-flash"

class SongsController < ApplicationController

  enable :sessions

  get '/songs' do
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do
   @song = Song.new(:name => params[:Name])
   @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
   @song.genre_ids = params[:genres]
   @song.save
   flash[:message] = "Successfully created song."
   redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

 post '/songs/:slug' do
    @song= Song.find_by_slug(params[:slug])
    if @song.artist.name != (params["Artist Name"])
      @song.artist = Artist.create(name: params["Artist Name"])
    end
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end
end