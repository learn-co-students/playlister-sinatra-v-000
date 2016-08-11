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
    @genres = @song.genres
    erb :'songs/edit'
  end

  patch '/songs/edit' do 
    binding.pry
    #update everything about the song based on all info from edit.erb
    #will have many genres and belong to one artist
    #go somewhere
  end

  
end