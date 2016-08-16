require 'rack-flash'

class SongsController < ApplicationController

  use Rack::Flash

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(params[:song])
    @song.artist = Artist.find_or_create_by(params[:artist])
    @song.genre_ids = params[:genres]
    @song.save

    flash[:message] = "Successfully created song."
    redirect to("/songs/#{@song.slug}")
  end

  get '/songs' do
   @songs = Song.all
   erb :'/songs/index'
  end

  get '/songs/:slug' do
    @song = Song.find_or_create_by(params[:artist])
    erb :'/songs/show'
  end

 get '/songs/:slug/edit' do
   @song = Song.find_by_slug(params[:slug])
   erb :'/songs/edit'
 end

 patch '/songs/:slug' do
   @song = Song.find_by_slug(params[:slug])
   @song.update(params[:song])
   @song.artist = Artist.find_or_create_by(params[:artist])
   @song.genre_ids = params[:genres]
   @song.save

   flash[:message] = "Successfully updated song."
   redirect to("/songs/#{@song.slug}")
 end

end
