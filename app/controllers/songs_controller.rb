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
    @song = Song.new(params[:song])
    @song.artist = Artist.create(params[:artist]) if !params[:artist][:name].empty?
    @song.genres << Genre.create(params[:genre]) if !params[:genre][:name].empty?
    @song.save
    redirect "/songs/new", locals: {message: "Successfully created song."}
  end

  get '/songs/:id/edit' do
    @song = Song.find(params[:id])
    erb :'songs/edit'
  end

  patch '/songs/:id' do
    
  end
end
