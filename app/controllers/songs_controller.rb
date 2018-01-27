require 'sinatra/base'
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
    @song = Song.create(params[:song])
    slug = @song.slug

    params["genres"].each do |genre_id|
      genre = Genre.find(genre_id.to_i)
      @song.genres << genre
    end

    if !Artist.find_by_name(params[:artist_name])
      @song.artist = Artist.create(name: params[:artist_name])
    else
      artist = Artist.find_by_name(params[:artist_name])
      @song.artist = artist
    end

    @song.save

    flash[:message] = "Successfully created song."
    redirect to "/songs/#{slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

end
