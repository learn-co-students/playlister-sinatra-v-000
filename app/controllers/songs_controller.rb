class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    @songs = Song.all

    erb :'songs/index'
  end

  post '/songs' do
    song = Song.create(name: params[:name])
    artist = Artist.find_or_create_by(name: params[:artist_name]) 
    genre = Genre.find(params[:genre_id])

    song.artist = artist
    song.song_genres.new(genre: genre)
    song.save

    flash[:message] = "Successfully created song."

    redirect "/songs/#{song.slug}"
  end

  get '/songs/new' do
    @genres = Genre.all

    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all

    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])
    song.artist = Artist.find_or_create_by(name: params[:artist_name])

    song.genres.clear
    Genre.all.each do |genre|
      if params[:genre_ids].include?(genre.id.to_s)
        song.genres << genre 
      end
    end

    song.save

    flash[:message] = "Successfully updated song."

    redirect "/songs/#{song.slug}"
  end

end
