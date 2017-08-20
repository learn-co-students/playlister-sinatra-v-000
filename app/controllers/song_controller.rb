require 'rack-flash'

class SongController < ApplicationController
  use Rack::Flash

  get '/songs' do
    erb :"/songs/index"
  end

  get '/songs/new' do
    erb :"/songs/new"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :"/songs/edit"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :"/songs/show"
  end

  post '/songs' do
    @song = Song.create(name: params[:song][:name])
    @song.artist = Artist.find_or_create_by(name: params[:song][:artist_name])
    if !params[:genres] && params[:new_genre][:name]
      new_genre = Genre.create(name: params[:new_genre][:name])
      @song.genre_ids = new_genre.id
    elsif params[:genres]
      @song.genre_ids = params[:genres]
    end
    @song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  patch '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(name: params[:song][:name])
    @song.artist = Artist.find_or_create_by(name: params[:song][:artist_name])
    @song.save
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end
end
