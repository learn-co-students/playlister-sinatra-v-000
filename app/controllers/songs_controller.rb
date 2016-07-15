require 'rack-flash'
class SongsController < ApplicationController

  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
    if is_filled_out?
      song = Song.create(name: params[:song][:name])
      song.artist = Artist.find_or_create_by(:name => params[:artist][:name])
      song.genre_ids = params[:genre][:ids]
      song.save

      flash[:message] = "Successfully created song."
      redirect "/songs/#{song.slug}"
    else
      flash[:message] = "Please include a song name, artist name, and at least one genre."
      redirect '/songs/new'
    end
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist
    @genres = @song.genres
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist
    @genres = Genre.all
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])

    # form validation
    if is_filled_out?
      song.name = params[:song][:song_name]
      song.artist = Artist.find_or_create_by(name: params[:artist][:name])
      song.genre_ids = params[:genre][:ids]
      song.save

      flash[:message] = "Successfully Updated!"
      redirect "/songs/#{song.slug}"
    else
      flash[:message] = "Please include a song name, artist name, and at least one genre."
      redirect "/songs/#{song.slug}/edit"
    end
  end


  helpers do
    def is_filled_out?
      params.include?("genre") && !(params[:song][:name].strip.empty?) && !(params[:artist][:name].strip.empty?)
    end
  end

end
