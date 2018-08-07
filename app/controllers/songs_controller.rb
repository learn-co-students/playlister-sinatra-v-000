require 'rack-flash'
class SongsController < ApplicationController

  use Rack::Flash

  get '/songs' do
    @songs = Song.all
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
    @song = Song.create(name: params["Name"])
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.genre_ids = params["genres"]
    @song.save
     flash[:message] = "Successfully created song."
    redirect("/songs/#{@song.slug}")
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'

  end


  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    if !params["Artist Name"].empty?
      @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    end
    @song.update("Artist Name")
    if !params["genres"].empty?
      @song.genre_ids = params["genres"]
    end
    @song.update("genres")
    @song.save

    flash[:message] = "Successfully created song."
   redirect("/songs/#{@song.slug}")

  end



end
