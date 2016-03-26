class SongController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  post '/songs' do
    @song = Song.create name: params[:song][:name]
    @song.genres << Genre.find_by(params[:genres])
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.save
    erb :'songs/show', locals: {message: "Successfully created song."}
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

end
