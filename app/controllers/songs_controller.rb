require "rack-flash"

class SongsController < ApplicationController
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
    if !params[:artist].empty?
      if Artist.find_by(name: params[:artist][:name])
        @song.artist = Artist.find_by(name: params[:artist][:name])
      else
        @song.artist = Artist.create(params[:artist])
      end
    end
    @song.save

    params[:genres].each do |genre_id|
      @song.genres << Genre.find(genre_id)
    end

    flash[:message] = "Successfully created song."
    redirect "songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'/songs/edit'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.artist.name = params[:artist][:name]
    if !params[:artist][:name].empty?
      if Artist.find_by(name: params[:artist][:name])
        @song.artist = Artist.find_by(name: params[:artist][:name])
      else
        @song.artist = Artist.create(params[:artist])
      end
    end
    @song.save

    @song.genres = []
    params[:genres].each do |genre_id|
      @song.genres << Genre.find(genre_id)
    end
    @song.save
    flash[:message] = "Successfully updated song."
    redirect "songs/#{@song.slug}"
  end
end
