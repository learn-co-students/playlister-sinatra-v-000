class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all

    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  post '/songs' do
    song = Song.new(name: params[:song][:name])

    params[:song][:genre_ids].each do |id|
      song.genres << Genre.find(id)
    end

    song.artist = Artist.find_or_create_by(params[:artist])
    song.save

    flash[:notice] = "Successfully created song."

    redirect "/songs/#{song.slug}"

  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find(@song.artist_id)
    @genres = @song.genre_ids.map { |g_id| Genre.find(g_id) }

    erb :'songs/edit'
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.name = params[:song][:name]
    @song.artist = Artist.find_or_create_by(name: params[:artist[:name]])
    @song.genres.clear
    params[:song][:genre_ids].each do |id|
      @song.genres << Genre.find(id)
    end
    @song.save

    flash[:notice] = "Successfully updated song."

    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find(@song.artist_id)
    @genres = @song.genre_ids.map { |g_id| Genre.find(g_id) }

    erb :'/songs/show'
  end
end
