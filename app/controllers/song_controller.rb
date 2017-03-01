require 'rack-flash'

class SongController < ApplicationController

  enable :sessions
  use Rack::Flash

  get '/' do
    erb :index
  end

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs/new' do
    song = Song.new(name: params[:name])
    song.artist = Artist.find_or_create_by(name: params[:artist])
    song.genres = params['genres'].map { |genre_id| Genre.find genre_id }
    song.save
    flash[:message] = 'Successfully created song.'
    redirect "/songs/#{song.slug}"
  end

  patch '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])
    song.name = params[:name]
    song.artist = Artist.find_or_create_by(name: params[:artist])
    song.genres = params['genres'].map { |genre_id| Genre.find genre_id }
    song.save
    flash[:message] = 'Successfully updated song.'
    redirect to "/songs/#{song.slug}"
  end

end
