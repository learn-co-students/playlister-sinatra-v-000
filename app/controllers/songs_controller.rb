class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    # binding.pry
    erb :'/songs/new'
  end

  post '/songs' do
    @artist ||= Artist.create(params[:artist])
    @song ||= Song.create(params[:song])
    @song.artist_id = @artist.id
    @song.save
    params[:genre][:genres_id].each {|genre_id| @song.genres << Genre.find(genre_id)}
    erb :'songs/show', locals: {message: "Successfully created song."}
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

end
