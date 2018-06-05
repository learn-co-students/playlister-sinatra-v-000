class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find(@song.artist_id)
    erb :'songs/show'
  end

  post '/songs/new' do
    @song = Song.find_or_create_by(name: params[:song_name])
    @artist = Artist.find_or_create_by(name: params[:artist_name])
    @song.artist_id = @artist.id
    @song.genre_ids = params[:genres]
    @song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  post '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find_or_create_by(name: params[:artist_name]) if !params[:artist_name].empty?
    @genre_ids = params[:genre_ids].map(&:to_i)
    @song.update(artist: @artist, genre_ids: @genre_ids)
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end

end
