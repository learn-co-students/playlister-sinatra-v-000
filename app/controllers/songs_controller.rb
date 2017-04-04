require 'rack-flash'

class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs' do
    artist = Artist.find_or_create_by(name: params[:artist_name])
    @song = Song.create(name: params[:song_name], artist_id: artist.id, genre_ids: params[:genres])

    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @genres = Genre.all
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'

  end

  post '/songs/:id' do
    # binding.pry
    @song = Song.find_by_slug(params[:id])
    if params[:artist_name] != ""
      artist = Artist.find_or_create_by(name: params[:artist_name])
      @song.update(artist_id: artist.id, genre_ids: params[:genres])
    else
      @song.update(genre_ids: params[:genres])
    end

    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end
end
