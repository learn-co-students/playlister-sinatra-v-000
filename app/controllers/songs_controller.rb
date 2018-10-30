require 'rack-flash'
class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  # post '/songs' do
  #   @song = Song.create(name: params[:song_name])
  #   @song.artists = Artist.find_or_create(name: params[:artist_name])
  #   @song.genre_ids = params[:genres]
  #   @song.save
  #
  #   redirect "/songs/#{@song.slug}"
  # end
  post '/songs' do
    @song = Song.create(name: params[:song_name])

    @song.artist = Artist.find_or_create_by(name: params[:artist_name])
    @song.genre_ids = params[:genres]
    @song.save

    flash[:message] = "Successfully created song."
    redirect to("/songs/#{@song.slug}")
  end

  get '/songs/:slug/edit' do
   @song = Song.find_by_slug(params[:slug])
   erb :'songs/edit'
 end

 patch '/songs/:slug' do
   @song = Song.find_by_slug(params[:slug])
   # binding.pry
   @song.update(name: params[:song_name])
   @song.artist = Artist.find_or_create_by(name: params[:artist_name])
   @song.genre_ids = params[:genres]
   @song.save
   flash[:message] = "Successfully updated song."
   redirect "/songs/#{@song.slug}"
 end
end
