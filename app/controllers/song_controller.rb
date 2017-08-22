class SongController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs' do
    artist_id = Artist.find_id_or_create_new_by_name(params["Artist Name"])
    genres = params["genres"].collect {|id| Genre.find(id)}
    song = Song.create(name: params["name"], artist_id: artist_id, genres: genres)

    flash[:message] = "Successfully created song."
    redirect to ("/songs/#{song.slug}")
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end


  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    artist_id = Artist.find_id_or_create_new_by_name(params["Artist Name"])
    genres = params["genres"].collect {|id| Genre.find(id)}
    @song.update(name: params["name"], artist_id: artist_id, genres: genres)
    # if !params["pet"]["name"].empty?
    #   @owner.pets << Pet.create(name: params["pet"]["name"])
    # end
    redirect to "songs/#{song.slug}"
  end

end
