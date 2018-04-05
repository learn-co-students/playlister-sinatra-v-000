  require 'rack-flash'
class SongsController < ApplicationController
  use Rack::Flash
  get '/songs' do
    @songs = Song.all
    erb :"/songs/index"
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :"/songs/new"
  end

  get '/songs/:slug' do
    #binding.pry
    @song = Song.find_by_slug(params[:slug])
    erb :"/songs/show"
  end

  post '/songs' do
    #binding.pry
    @song = Song.create(name: params[:Name])
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.genre_ids = params[:genres]
    @song.save

    flash[:message] = "Successfully created song."

    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    #binding.pry
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/edit"
  end

#remember update corresponds to PATCH!! the edit form needs syntax for patch (hidden input _method)
  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    #binding.pry
    @song.update(name: params["Name"], artist: ["Artist Name"], genre_ids: params[:genres])
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.save


    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end


end
