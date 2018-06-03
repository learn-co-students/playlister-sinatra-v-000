class SongsController < ApplicationController
  get '/songs' do
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find(@song.artist_id)
    erb :'songs/show'
  end

  post '/songs/new' do
    # params.delete(:captures)
    binding.pry
    @song = Song.create(name: params[:song_name])
    @artist = Artist.find_or_create_by(name: params[:artist_name])
    @song.artist_id = @artist.id
    @song.genre_ids = params[:genres]
    @song.save
    binding.pry
    redirect "/songs/#{@song.slug}"
  end

end
