class SongsController < ApplicationController

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
    if !params[:song].keys.include?('artist_id') && Artist.find_by(name: params[:song]["artist_id"]) == nil
      artist = Artist.create(name: params[:song]["artist_name"])
      song.artist_id = artist.id
    elsif !params[:song].keys.include?('artist_id') && Artist.find_by(name: params[:song]["artist_id"]) != nil
      song.artist_id = Artist.find_by(name: params[:song]["artist_id"]).id
    else
      song.artist_id = params[:song]["artist_id"].first
    end
    song.save
    redirect '/songs/' + song.slug
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/view'
  end

end
