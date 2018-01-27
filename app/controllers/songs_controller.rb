class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(params[:name])
    slug = @song.slug
    @genre = Genre.create(params["genre.id"])
    @song.artist = Artist.create(name: params["Artist Name"])
    @song.save
    redirect to "/songs/#{slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

end
