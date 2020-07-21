require 'rack-flash'
class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @artists = Artist.all
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs' do
    if Artist.find_by_name(params[:song][:artist][:name])
    @artist = Artist.find_by_name(params[:song][:artist][:name])
    else
    @artist = Artist.create(name: params[:song][:artist][:name])
    end
    @song = Song.create(name: params[:song][:name], artist: @artist)
    if params[:genres]
      params[:genres].each do |genre_id|
        @song.genres.push(Genre.find(genre_id))
      end
    end
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.name = params[:song][:name]
    if Artist.find_by_name(params[:song][:artist][:name])
    @artist = Artist.find_by_name(params[:song][:artist][:name])
    else
    @artist = Artist.create(name: params[:song][:artist][:name])
    end
    @song.artist = @artist
    @song.genres = []
    if params[:genres]
      params[:genres].each do |genre_id|
        @song.genres.push(Genre.find(genre_id))
      end
    end
    @song.save
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end


end
