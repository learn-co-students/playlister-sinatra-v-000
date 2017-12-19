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
    @song = Song.new(name: params[:name])
    @song.artist = Artist.find_or_create_by(name: params[:artist])
    @song.genres << Genre.find(params[:genres][0])
    @song.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :"songs/edit"
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.genres = Genre.find_by(params[:genre])
    @song.save
    redirect "/songs/:slug"
  end
end
