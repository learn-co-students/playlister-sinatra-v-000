require 'pry'
class SongsController < ApplicationController

  get '/songs' do
    erb :"/songs/index"
  end

  get '/songs/new' do
    erb :"/songs/new"
  end

  post '/songs' do
    @song = Song.create(params[:song])
    if !params["artist"]["name"].empty?
      @artist = Artist.find_or_create_by(name: params["artist"]["name"])
      @song.artist = @artist
      @artist.songs << @song
      @artist.save
    end
    if !params["genre"]["name"].empty?
      @genre = Genre.find_or_create_by(name: params["genre"]["name"])
      @song.genres << @genre
      @genre.songs << @song
      @genre.save
    end
    @song.save
    erb :"/songs/show", locals:{message: "Successfully created song."}
    # redirect '/songs'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :"/songs/show"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :"/songs/edit"
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    if !params[:song][:name].empty?
      @song.update(params[:song])
    end
    if !params[:song][:artist].empty?
      @song.artist = Artist.find_or_create_by(name: params[:song][:artist])
    end
    @genre = Genre.find_by_id(params[:song][:genre_ids])
    if !@song.genres.include?(@genre)
      @song.genre_ids = params[:song][:genre_ids]
    end
    @song.save
    erb :'/songs/show', locals:{message: "Song successfully updated."}
  end

end
