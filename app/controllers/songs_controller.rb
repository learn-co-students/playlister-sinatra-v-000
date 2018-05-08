class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs' do
    @song = Song.create(:name => params[:song][:name])
    @artist = Artist.create(:name => params[:artist][:name])
    @song.artist = @artist
    @song_slug = @song.slug
    @artist_slug = @artist.slug
    redirect to "/songs/#{@song_slug}"
  end

end
