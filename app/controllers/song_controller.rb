require "rack-flash"

class SongController < ApplicationController

  use Rack::Flash

  get '/songs' do
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(name: params[:song][:name])
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.genres = params[:genres].collect do |genre_id|
       Genre.find_by(id: genre_id)
    end

    @song.save

    flash[:message] = "Successfully created song."

    redirect "/songs/#{ @song.slug }"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist
    @genres = @song.genres

    flash[:message] = "Successfully updated song."
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(
      name: params[:song][:name],
      artist: Artist.find_or_create_by(name: params[:artist][:name]),
      genres: params[:genres].collect { |genre_id| Genre.find_by(id: genre_id) }
    )

    redirect "/songs/#{ @song.slug }"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find_by(id: @song.artist_id)
    @genres = @song.genres
    erb :'/songs/show'
  end
end
