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
      song.genres << Genre.find_or_create_by(name: genre)
    end
    song.save
    flash[:success] = "Successfully created song."
    binding.pry
    redirect "/songs/#{song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

end
