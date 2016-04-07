class SongsController < ApplicationController
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
    @song = Song.create(
      name: params[:name],
      artist: Artist.find_or_create_by(name: params[:artist]),
      genres: params[:genres]
      )
    #@song.add_genres(params)
    erb :'songs/show', locals: {message: "Successfully created song."}
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(
      artist: Artist.find_or_create_by(name: params[:song][:artist]),
      genre_ids: params[:song][:genre_ids]
      )
    erb :'songs/show', locals: {message: "Song successfully updated."}
  end


end