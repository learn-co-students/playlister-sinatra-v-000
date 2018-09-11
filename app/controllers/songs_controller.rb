require 'rack-flash'
class SongsController < ApplicationController

  use Rack::Flash

  get '/songs' do
    @songs = Song.all

    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    @artists = Artist.all
    erb :'/songs/new'
  end

  post '/songs' do
    song = Song.new(name: params[:song]["name"])
    params[:song]["genre_ids"].each do |id|
      song.genres << Genre.find(id)
    end
    if Artist.find_by(name: params[:song]["artist_name"]) == nil
      artist = Artist.create(name: params[:song]["artist_name"])
      song.artist_id = artist.id
    else
      song.artist_id = Artist.find_by(name: params[:song]["artist_name"]).id
    end
    song.save
    flash[:message] = "Successfully created song."
    redirect '/songs/' + song.slug
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    @song.name = params[:song]["name"]
    @song.update(genre_ids: params[:song]["genre_ids"])
    if Artist.find_by(name: params[:song]["artist_name"]) == nil
      artist = Artist.create(name: params[:song]["artist_name"])
      @song.artist_id = artist.id
    else
      @song.artist_id = Artist.find_by(name: params[:song]["artist_name"]).id
    end
    @song.save
    flash[:message] = "Successfully updated song."
    redirect '/songs/' + @song.slug
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/view'
  end

end
