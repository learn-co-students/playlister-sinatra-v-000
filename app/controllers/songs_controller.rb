class SongsController < ApplicationController
enable :sessions
use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(name: params[:song][:name])
    artist = Artist.find_or_create_by(params[:artist])
    artist.songs << @song
    @song.genre_ids = params[:song][:genre_ids]
    @song.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    old_artist = @song.artist
    @song.update(name: params[:song][:name])
    new_artist = Artist.find_or_create_by(name: params[:artist][:name])
    if old_artist != new_artist
      old_artist.songs.delete(@song)
      new_artist.songs << @song
      old_artist.save
      new_artist.save
    end
    @song.genre_ids = params[:song][:genre_ids]
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end

end
