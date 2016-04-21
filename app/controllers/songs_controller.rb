
class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs' do
    song = Song.create(name: params[:name],
                     artist: Artist.find_or_create_by(name: params[:artist]),
                  genres_id: params[:genres])
    song.save
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])
    song.update(name: params[:song])
    song.artist = Artist.find_or_create_by(name: params[:artist][:name]),
    song.save
    erb :'songs/show'
  end

end
