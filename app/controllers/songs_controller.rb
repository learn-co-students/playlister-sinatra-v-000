class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @artists = Artist.all
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @slug = Song.find_by_slug(params[:slug].gsub("-"," "))
    @artist = Artist.find(@slug.artist_id)
    erb :'songs/show'
  end

  post '/songs' do
    binding.pry
    @artists = Artist.all
    # Artist.create(name: params[:artist_name])
    # genre_name = Genre.create(name: params[:genre_name])
    # song = Song.create(name:params[:song_name], artist_id: artist.id)

  end

end
