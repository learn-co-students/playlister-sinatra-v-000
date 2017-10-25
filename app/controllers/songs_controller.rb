class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all.order(:name)
    erb :"/songs/index"
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :"/songs/new"
  end

  post '/songs' do
    song = Song.new(params[:song])
    song.artist = Artist.find_or_create_by(params[:artist])
    song.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :"/songs/show"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :"/songs/edit"
  end

  patch '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])
    song.artist = Artist.find_or_create_by(params[:artist])
    song.update(params[:song])
    song.save
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{song.slug}"
  end
end
