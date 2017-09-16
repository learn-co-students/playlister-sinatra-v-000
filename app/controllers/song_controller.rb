require 'rack-flash'
class SongController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    erb :'/songs/index'
  end

  post '/songs' do
     @song = Song.new(name: params[:name])
     @song.artist = Artist.find_or_create_by(name: params[:"Artist Name"])
     @song.genre_ids = params[:genres]
     @song.save
     flash[:message] = "Successfully created song."
     redirect to("/songs/#{@song.slug}")
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(name: params[:name])
    @song.artist = Artist.find_or_create_by(name: params[:"Artist Name"])
    @song.genre_ids = params[:genres]
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to("/songs/#{@song.slug}")
  end

end
