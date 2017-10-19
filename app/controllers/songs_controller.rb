require 'rack-flash'


class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    @songs = Song.all

    erb :'songs/index'
  end

  get '/songs/new' do #needs to go here

    erb :'songs/new'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  get '/songs/:slug' do #this is the 'show page'
    @song = Song.find_by_slug(params[:slug])

    erb :'songs/show'
  end

  post '/songs' do
    @song = Song.create(:name => params[:song_name])
    @song.artist = Artist.find_or_create_by(:name => params[:artist_name])
    @song.genre_ids = params[:genres]

      if @song.save
        #binding.pry
        flash.now[:message] = "Successfully created song."
        redirect("/songs/#{@song.slug}")
      else
        flash.now[:message] = "Something went wrong."
        erb :'songs/new'
      end

  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:slug])
    @song.artist = Artist.find_or_create_by(:name => params[:artist_name])
    @song.save

    flash.now[:message] = "Successfully updated song."

    redirect("/songs/#{@song.slug}")
  end


end
