require 'pry'
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
      @song = Song.create(name: params["name"])
      @song.artist = Artist.find_or_create_by(name: parmas["Artist Name"])
      @song.genre_ids = params[:genres]
      @song.save

      flush[:message] = "Successfully created song."
      erb :'/songs/show'
    end

    get '/songs/:slug/edit' do
      @song = Song.find_by_slug(params[:slug])
      erb :'songs/edit'
    end

#    patch '/songs/:slug'
#      @song = Song.find_by_slug(parmas[:slug])
#      @song.update(params[:song])
#      @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
#      @song.save

#    flash[:message] = "Successfully created song."
#    erb :"/song/show"
#  end

end
