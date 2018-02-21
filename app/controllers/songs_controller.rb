class SongsController < ApplicationController

  use Rack::Flash

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
    erb :"songs/show"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :"songs/edit"
  end

  post '/songs' do
    @song = Song.create(name: params[:song][:name])
    @artist = Artist.find_or_create_by(name: params[:artist_name])
    @song.artist = @artist
    @artist.songs << @song
    @song.genre_ids = params[:song][:genre_ids]
    # Genre.find(params[:song][:genre_ids]).each do |genre|
    #   @song.genres << genre
    # end
    @song.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find_or_create_by(name: params[:artist_name])
    @song.update(name: params[:song][:name], artist_id: @artist.id)
    @song.genre_ids = params[:song][:genre_ids]
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end

end
