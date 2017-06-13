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
    params[:song][:genre].each do |genre|
      if !genre.nil?
        song.genres << Genre.find_or_create_by(name: genre)
      end
    end
    if song.save
      flash[:success] = "Successfully created song."
    end
    redirect "/songs/#{song.slug}"
  end

  get '/songs/:slug/edit' do
    @genres = Genre.all
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  post '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])
    song.name = params[:song][:name]
    song.artist = Artist.find_or_create_by(name: params[:song][:artist])
    song.genres.clear
    params[:song][:genre].each do |genre|
      if !genre.nil?
        song.genres << Genre.find_or_create_by(name: genre)
      end
    end
    if song.save
      flash[:updated] = "Successfully updated song."
    end
    redirect "/songs/#{song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end


end
