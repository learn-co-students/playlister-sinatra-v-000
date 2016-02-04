class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :"songs/index"
  end
  
  get '/songs/new' do
    @genres = Genre.all
    erb :"songs/new"
  end

  post '/songs' do
    @artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song = Song.create(name: params["Name"], artist: @artist)
    params["genres"].each do |i|
      genre = Genre.find_by_id(i.to_i)
      @song.genres << genre
    end
    erb :"songs/show", locals: {message: "Successfully created song."}
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params["slug"])
    erb :"songs/show"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params["slug"])
    @genres = Genre.all
    erb :"songs/edit"
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params["slug"])
    if params["Artist Name"] != ""
      @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    end
    if params["genres"]
      params["genres"].each do |i|
        genre = Genre.find_by_id(i.to_i)
        @song.genres << genre
      end
    end

    erb :"songs/show", locals: {message: "Song successfully updated."}
  end


end