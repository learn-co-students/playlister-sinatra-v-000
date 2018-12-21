require 'rack-flash'

class SongsController < ApplicationController

  use Rack::Flash

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs' do
    erb :'songs/index'
  end

  get '/songs/:slug' do
    slug = params[:slug]
    @song = Song.find_by_slug("#{slug}")
    erb :'songs/show'
  end

  post '/songs' do
    @song = Song.create(:name => params["Name"])
    @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
    @song.genre_ids = params[:genres]
    @song.save
    flash[:message] = "Successfully created song."
    redirect("/songs/#{@song.slug}")
  end

  patch '/songs/:slug' do
    @artist = Artist.find_or_create_by(:name => params["Artist Name"])
    @song = Song.find_by_slug(params[:slug])
    @song.artist = @artist
    @song.genre_ids = params[:genres]
    @song.save
    flash[:message] = "Successfully updated song."
    redirect("/songs/#{@song.slug}")
  end

end
