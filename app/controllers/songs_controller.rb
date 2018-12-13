class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    @song ||= Song.create(params[:song])
    @artist ||= Artist.create(params[:artist])
    @song.artist_id = @artist.id
    @song.save
    params[:genres].each {|genre_id| @song.genres << Genre.find(genre_id)}
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

end
