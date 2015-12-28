class SongController < ApplicationController

  get '/songs' do
    @songs = Song.all.sort_by(&:name)
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs' do
    @song = Song.create(name: params[:song_name])
    @song.artist = Artist.find_or_create_by(name: params[:artist_name])
    @song.genre_ids = params[:genre]
    @song.save

    erb :'songs/show', :locals => { success: "Successfully created song." }
  end

  get '/songs/:slug/edit' do
    @song = Song.all.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.artist = Artist.find_or_create_by(name: params[:artist_name])
    @song.genre_ids = params[:genre]
    @song.save

    erb :'songs/show', :locals => { success: "Song successfully updated." }
  end


end
