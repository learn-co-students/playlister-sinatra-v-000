require 'pry'
class SongsController < ApplicationController

  get '/songs' do
    erb :"songs/index"
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs' do
    song = Song.new
    song.name = param["Name"]
    if params["Artist Name"] != ""
      if Artist.exists?(name: params["Artist Name"])
        song.artist = Artist.find_by(name: params["Artist Name"])
      else
        song.build_artist(name: params["Artist Name"])
      end
    else
      song.artist = Artist.find(params["Artist"])
    end
    song.save

    flash[:message] = "Successfully created song."
    redirect to ("songs/#{song.slug}")
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])

    erb :'songs/edit'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

end
