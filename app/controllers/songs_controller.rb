require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash

  # view all songs
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  # make a new song
  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :'/songs/new'
  end

  # view certain songs
  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  # process new song and show it
  post '/songs' do
    @song = Song.create(params[:song])

    unless params[:artist][:name].empty?
      @song.artist = Artist.find_or_create_by(params[:artist])
      @song.save
    end

    unless params[:genre][:name].empty?
      genre = Genre.find_or_create_by(params[:genre])
      @song.song_genres.build(genre: genre)
      @song.save
    end

    flash[:message] = 'Successfully created song.'

    redirect "/songs/#{@song.slug}"
  end
end
