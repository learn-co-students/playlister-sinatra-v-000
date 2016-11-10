require 'rack-flash'

class SongController  < ApplicationController
  use Rack::Flash

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

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  post '/songs/new' do
    song = Song.create(params[:song])
    song.update(artist: Artist.find_or_create_by(params[:artist]))
    flash[:message] = "Successfully created song."
    redirect "/songs/#{song.slug}"
  end

  post '/songs/:slug/edit' do
    song = Song.find_by_slug(params[:slug])
    song.update(artist: Artist.find_or_create_by(params[:artist]))
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{song.slug}"
  end

end
