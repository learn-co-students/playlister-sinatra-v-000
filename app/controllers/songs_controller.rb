require 'rack-flash'
require 'pry'

class SongsController < ApplicationController

  enable :sessions

  use Rack::Flash

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

  post '/songs' do
    @song = Song.create(name: params[:Name])
    @song.artist = Artist.find_or_create_by(name: params['Artist Name'])
    @song.genre_ids = params['genres']
    @song.save
    # binding.pry

    flash[:message] = "Successfully created song."
    redirect to("/songs/#{@song.slug}")
  end

  get '/songs/:slug/edit' do
    slug = params[:slug]
    @song = Song.find_by_slug(slug)
    erb :"songs/edit"
  end

  patch '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])
    # <Song:0x00000001c3f7e8 id: 1, name: "That One with the Guitar", artist_id: 1>

    song.name = params[:song][:name]
    # "That One with the Guitar"

    artist_name = params[:song][:artist]
    # "Some Nobody"

    if Artist.find_by(:name => artist_name)
      if song.artist.name != artist_name
        song.artist = Artist.find_by(:name => artist_name)
      end
    else
      song.artist = Artist.create(:name => artist_name)
    end

    if song.genres
      song.genres.clear
    end
    genres = params[:song][:genres] #array of genre ids
    genres.each do |genre_id|
      song.genres << Genre.find(genre_id)
    end
    song.save

    flash[:message] = "Successfully updated song."

    redirect to "songs/#{song.slug}"
  end

end
