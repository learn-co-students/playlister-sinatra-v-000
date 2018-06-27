class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs' do
    artist = Artist.find(params[:artist]) if params.has_key?(:artist)
    artist = Artist.find_or_create_by(name: params["Artist Name"]) if !params["Artist Name"].empty?
    song = Song.new(name: params["Name"])
    song.artist = artist
    params[:genres].each {|genre_id| song.genres << Genre.find(genre_id)}
    song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end
end
