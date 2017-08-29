require 'pry'
require 'rack-flash'
class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    #binding.pry
    erb :'songs/show'
  end

  post '/songs' do
    @song = Song.create(params[:song])
    @song.artist = Artist.find_or_create_by(:name => params[:artist_name])
    @song.genres << Genre.find_or_create_by(:id => params[:genres])
    @song.save
    #binding.pry
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    @song.artist = Artist.find_or_create_by(:name => params[:artist_name])
    @song.save
    #binding.pry
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end



end
