class SongsController < ApplicationController

  get '/songs' do
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  post '/songs' do

    if !Artist.find_by_name(params[:song][:artist])
      @artist = Artist.create(name: params[:song][:artist])
    else
      @artist = Artist.find_by_name(params[:song][:artist])
    end
    @new_song = Song.new(name: params[:song][:name], artist: @artist)

    params[:song][:genre_ids].each do |genre_id|
      @new_song.genres << Genre.find_by_id(genre_id)
    end

    @new_song.save
    redirect "/songs/#{@new_song.slug}"

  end
  get '/songs/:slug' do

    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'

  end

end