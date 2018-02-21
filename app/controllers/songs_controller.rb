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
    @song = Song.create(name: params[:song][:name])
    @artist = Artist.find_or_create_by(name: params[:artist_name])
    @song.artist = @artist
    @artist.songs << @song
    Genre.find(params[:song][:genre_ids]).each do |genre|
      @song.genres << genre
    end
    @song.save
    redirect to "/songs/#{@song.slug}"
  end

end
