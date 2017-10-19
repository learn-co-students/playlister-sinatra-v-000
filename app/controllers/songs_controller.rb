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

  get '/songs/:slug' do #this is the 'show page'
    @song = Song.find_by_slug(params[:slug])

    @success_message = session[:success_message]
    session[:success_message] = nil
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])

    erb :'songs/edit'
  end

  post '/songs' do
    @song = Song.create(:name => params[:song_name])
    @song.artist = Artist.find_or_create_by(:name => params[:artist_name])
    @song.genre_ids = params[:genres]
    @song.save
        #binding.pry
    session[:success_message] = "Successfully created song."
    redirect("/songs/#{@song.slug}")

  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:slug])
    @song.artist = Artist.find_or_create_by(:name => params[:artist_name])
    @song.save

    session[:success_message] = "Song successfully updated."

    redirect("/songs/#{@song.slug}")
  end


end
