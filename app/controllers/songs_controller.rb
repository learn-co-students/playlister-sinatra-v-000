class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  post '/songs' do
    @song = Song.create(params[:song])
    if !params[:artist_name].empty?
      @song.artist = Artist.create(name: params[:artist_name])
    end

    @song.save
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/new' do
    @genres = Genre.all
    @artists = Artist.all
    erb :'songs/new'
  end

  get '/songs/:slug' do

    @song = Song.find_by_slug(params[:slug])
    erb :song_show

    # erb :'songs/show' -- This just will not work for some reason and keeps throwing 500 errors on this route.
  end

end
