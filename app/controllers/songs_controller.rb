class SongsController < ApplicationController

  get '/songs' do
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
    song = Song.create(name: params[:song])
    if params[:artist][:id] > 0
      song.artist = Artist.find(params[:artist][:id])
    else
      song.artist = Artist.create(name: params[:artist])
    end
    song.genres << Genre.new(name: params[:genre])
  end

end
