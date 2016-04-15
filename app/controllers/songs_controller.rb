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

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    @song.artist = Artist.create(params[:artist]) if !params[:artist][:name].empty?
    @song.genres << Genre.create(params[:genre]) if !params[:genre][:name].empty?
    @song.save
    redirect "/songs/#{@song.slug}", locals: {message: "Song successfully updated."}
  end
end
