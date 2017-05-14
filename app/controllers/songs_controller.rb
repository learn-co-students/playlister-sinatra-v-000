class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :"songs/index"
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :"songs/new"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :"songs/edit"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/show"
  end

  post '/songs' do
    params[:song][:artist] = Artist.find_or_create_by(name: params[:artist_name])
    if params[:genre_name] != ""
      new_genre = Genre.find_or_create_by(name: params[:genre_name])
      params[:song][:genre_ids] << new_genre.id
    end
    song = Song.create(params[:song])

    flash[:message] = "Successfully created song."

    redirect "/songs/#{song.slug}"
  end

  post '/songs/:slug/edit' do
    params[:song][:artist] = Artist.find_or_create_by(name: params[:artist_name])
    if params[:genre_name] != ""
      new_genre = Genre.find_or_create_by(name: params[:genre_name])
      params[:song][:genre_ids] << new_genre.id
    end
    song = Song.find_by_slug(params[:slug])
    song.update(params[:song])

    flash[:message] = "Successfully updated song."

    redirect "/songs/#{song.slug}"
  end
end
