require 'rack-flash'

class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(params[:song])
    if !params["artist_name"].empty?

      @song.artist = Artist.find_or_create_by(name: params["artist_name"])
      # binding.pry
    else
      artist = Artist.find_by(id: params[:song][:artist_id])
      @song.artist = artist
    end

    if !params["genre"]["name"].empty?
      @song.genres << Genre.create(name: params["genre"]["name"])
    else
      genre = Genre.find_by(id: params[:genres][:name])
      @song.genres << genre
    end
    @song.save
    flash[:message] = "Successfully created song."
    redirect "songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    @artists = Artist.all
    erb :'/songs/edit'
  end


  post '/songs/:slug' do
    @song.update(params["song"])
    if !params["genre"]["name"].empty?
      @song.genres << Genre.create(name: params["genre"]["name"])
    end
    if !params[:artist][:name].empty?
      @song.artist = Artist.create(name: params[:artist][:name])
      @song.save
    end
    flash[:message] = "Successfully created song."
    redirect to "songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end



end
