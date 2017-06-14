class SongController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs' do
    song = Song.new(name: params[:song][:name])
    song.artist = Artist.find_or_create_by(name: params[:song][:artist])
    song.genre_ids = params[:song][:genre_ids]
    song.genres.build(params[:song][:new_genre]) unless params[:song][:new_genre].nil?
    flash[:success] = "Successfully created song." if song.save

    redirect "/songs/#{song.slug}"
  end

  get '/songs/:slug/edit' do
    @genres = Genre.all
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  post '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])
    song.artist = Artist.find_or_create_by(name: params[:song][:artist])

    song.name = params[:song][:name]
    song.artist = Artist.find_or_create_by(name: params[:song][:artist])
    song.genre_ids = params[:song][:genre_ids]
    song.genres.build(params[:song][:new_genre]) unless params[:song][:new_genre].nil?
    flash[:updated] = "Successfully updated song." if song.save
    redirect "/songs/#{song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end


end
