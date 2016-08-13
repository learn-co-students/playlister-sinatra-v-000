class SongsController < ApplicationController
  
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all 
    erb :'songs/new'
  end

  post '/songs/new' do
    artist = Artist.find_or_create_by(name: params[:song][:artist]) if !params[:song][:artist].empty?
    @song = Song.create(name: params[:song][:name])
    @song.artist = artist
    params[:song][:genres].each do |genre_id|
      @song.genres << Genre.find(genre_id)
    end
    @song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do 
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist
    @genres = @song.genres
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist
    @genres = Genre.all
    erb :'songs/edit'
  end

  post '/songs/:slug' do 
    song = Song.find_by_slug(params[:slug])
    song.artist = Artist.find_or_create_by(name: params[:song][:artist]) if !params[:song][:artist].empty?
    if params[:song].include?(:genres)
      params[:song][:genres].each do |genre_id|
        song.genres << Genre.find(genre_id) if !song.genres.include?(Genre.find(genre_id))
      end
    end
    song.save
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{song.slug}"
  end

  
end