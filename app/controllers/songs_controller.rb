require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  post '/songs' do
    @song = Song.create name: params['Name']
    @song.artist = Artist.find_or_create_by name: params['Artist Name']
    @song.genres = params['genres'].map { |genre_id| Genre.find genre_id }
    @song.save
    flash[:message] = 'Successfully created song.'
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/new' do
    @song = Song.new
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug params[:slug]
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug params[:slug]
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug params[:slug]
    @song.update name: params['Name']
    @song.artist = Artist.find_or_create_by name: params['Artist Name']
    @song.genres = params['genres'].map { |genre_id| Genre.find genre_id }
    @song.save
    flash[:message] = 'Successfully updated song.'
    redirect "/songs/#{@song.slug}"
  end
end
