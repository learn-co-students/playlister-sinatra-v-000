require 'rack-flash'

class SongController < ApplicationController
  use Rack::Flash

  get '/songs' do
    @songs = Song.all

    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all

    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    erb :'/songs/show'
  end

  post '/songs' do
    @artist = Artist.find_or_create_by(:name => params[:artist_name])
    @new_song = Song.create(:name => params[:song_name], :artist => @artist)
    @new_song.genre_ids = params[:genre_ids]
    @new_song.save

    # https://github.com/nakajima/rack-flash
    flash[:message] = "Successfully created song."

    redirect "/songs/#{@new_song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])

    erb :"/songs/edit"
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.name = params[:song_name]
    @song.artist = Artist.find_or_create_by(name: params[:artist_name])
    @song.genre_ids = params[:genres]
    @song.save

    flash[:message] = "Successfully updated song."

    redirect "/songs/#{@song.slug}"
  end
end
