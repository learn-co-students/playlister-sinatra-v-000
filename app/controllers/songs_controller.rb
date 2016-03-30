class SongsController < ApplicationController

  get '/songs' do 
    erb :'/songs/index'
  end

  get '/songs/new' do 
    erb :'/songs/new'
  end

  post '/songs' do 
    @song = Song.new(params["song"])
    all_genres = params(:existing_genre_name)
    all_genres.each do |genre|
      @song.genres << Genre.find_by(name: params(genre))
    end
    if !params["genre_name"].empty?
      @song.genres << Genre.create(name: params["genre_name"])
    end

    if !params["artist_name"].empty?
      @song.artist = Artist.create(name: params["artist_name"])
    else
      @song.artist.id = params["artist_id"]
    end
    @song.save

    redirect '/songs'
  end

  get '/songs/:slug' do 
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show', locals: {message: "Song successfully updated."}
  end

  get '/songs/:slug/edit' do 
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  post '/songs/:slug' do 
    @song = Song.find_by_slug(params[:slug])
    @song.update(params["song"])
    @song.genres = []
    all_genres = params[:existing_genre_name]
    all_genres.each do |genre|
      @song.genres << Genre.find_by(name: genre)
    end

    if !params["genre_name"].empty?
      @song.genres << Genre.create(name: params["genre_name"])
    end
      

    if !params["artist_name"].empty?
      @song.artist = Artist.create(name: params["artist_name"])
    else
      @song.artist.id = params["artist_id"]
    end
    @song.save

    redirect "/songs/#{@song.slug}"
  end


end
