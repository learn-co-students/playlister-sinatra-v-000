require 'rack-flash'

class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist
    erb :'/songs/show'
  end

  post '/songs' do
    @song = Song.create(name: params[:name])
    if !params[:genres].blank?
      @song.genre_ids = params[:genres]
    end
    if params[:new_artist_name].blank?
      @artist = Artist.find_by(params[:artist_name])
      @song.artist = @artist
    else
      @artist = Artist.find_or_create_by(name: params[:new_artist_name])
      @song.artist = @artist
    end
    @song.save
    flash[:message] = "Successfully created song."
    redirect("/songs/#{@song.slug}")
    # redirect "/songs/#{@song.slug}"
    # redirect to("/songs/#{@song.slug}")
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs' do
    @song = Song.find_by_slug(params[:slug])

    @song.update(genre_ids: params[:genres])

    if params[:new_artist_name].blank?
      @artist = Artist.find_by(params[:artist_name])
    else
      @artist = Artist.find_or_create_by(name: params[:new_artist_name])
    end
    @song.update(artist: @artist)

    flash[:message] = "Successfully updated song."

    redirect("/songs/#{@song.slug}")
  end

end
