require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash
  enable :sessions

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    #binding.pry
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do
    @song = Song.find_or_create_by(name: params["song"]["name"])
    @artist = Artist.find_or_create_by(name: params["artist"]["name"])
    @song.genre_ids = params[:genres]
    @song.artist_id = @artist.id
    @song.save
    # flash[:message] = "Successfully created song."
    # redirect "/songs/#{@song.slug}"
    flash[:message] = "Successfully created song."
    redirect to("/songs/#{@song.slug}")
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    #binding.pry
    @song = Song.find_by_name(params[:song][:name])
    @song.update(params[:song])
    #binding.pry

    @song.song_genres.clear
    params[:genre].each do |genre_id|
       @song.genres << Genre.find(genre_id.to_i)
    end

    flash[:message] = "Successfully updated song."
    redirect to("/songs/#{@song.slug}")
  end
end
