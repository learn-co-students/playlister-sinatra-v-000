require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash

  configure do
    enable :sessions
    set :session_secret, "secret"
  end

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

  post '/songs/:slug' do
    @song = Song.create(params[:song])
    @song.artist = Artist.find_or_create_by(params[:artist]) if !params[:artist][:name].empty?
    params[:genres].each {|genre| @song.genres << Genre.find(genre)}
    
    @song.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :"/songs/edit"
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.artist = Artist.create(params[:artist]) if !params[:artist][:name].empty?
    @song.genres = params[:genres].map {|genre| Genre.find(genre)}

    @song.save
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end

end
