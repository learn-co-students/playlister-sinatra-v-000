require 'pry'
class SongsController < ApplicationController

  get '/songs' do

      erb :'songs/index'
  end

  get '/songs/new' do

    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])

    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(name: params["Name"])
    if Artist.find_by_name(params["Artist Name"])
      @song.artist = Artist.find_by_name(params["Artist Name"])
    else
      @song.artist = Artist.create(name: params["Artist Name"])
    end
    @song.genre_ids = params["genres"]
    @song.save
    flash[:message] = "Successfully updated song."
    redirect("/songs/#{@song.slug}")
  end

  post '/songs' do
    puts params
    @song = Song.create(name: params["Name"])
    if Artist.find_by_name(params["Artist Name"])
      @song.artist = Artist.find_by_name(params["Artist Name"])
    else
      @song.artist = Artist.create(name: params["Artist Name"])
    end
    @song.genre_ids = params["genres"]
    @song.save
    flash[:message] = "Successfully created song."
    redirect("/songs/#{@song.slug}")
  end

end
