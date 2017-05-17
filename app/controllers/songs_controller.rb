class SongsController < ApplicationController

  enable :sessions
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
    erb :'songs/show'
  end

  post '/songs' do
    song = Song.create(name: params[:name])
    params[:genres].each do |id|
      song.genres << Genre.find(id)
    end
    if artist = Artist.find_by(name: params[:artist])
      song.artist = artist
    else
      song.create_artist(name: params[:artist])
    end
    song.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])
    song.genres = params[:genres].collect{|id| Genre.find(id)}
    if artist = Artist.find_by(name: params[:artist])
      song.artist = artist
    else
      song.create_artist(name: params[:artist])
    end
    song.save
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{song.slug}"
  end

end
