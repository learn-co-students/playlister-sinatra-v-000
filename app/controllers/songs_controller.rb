class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs' do
    @song = Song.create(name: params[:name])
    @song.artist = Artist.find_or_create_by(name: params[:artist])
    @song.genre_ids = params[:genres]
    #params[:genres].each { |genre| @song.genres << Genre.find_by(name: genre)}
    #binding.pry
    @song.save
    #redirect to "/songs/#{@song.slug}"
    erb :'songs/show', locals: {message: "Successfully created song."}
  end

  get '/songs/:slug/edit' do
    @genres = Genre.all
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.artist = Artist.find_or_create_by(name: params[:artist])
    @song.genre_ids = params[:genres]
    @song.save
    erb :'songs/show', locals: {message: "Song successfully updated."}
  end
end