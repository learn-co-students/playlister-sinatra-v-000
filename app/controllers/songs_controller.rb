class SongsController < ApplicationController
  get '/songs' do
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  post '/songs' do
    @song = Song.create(name: params[:name])

    if params[:artist_name].empty?
      @song.artist = Artist.find_or_create_by(name: params[:artist].keys.first)
    else
      @song.artist = Artist.find_or_create_by(name: params[:artist_name])
    end

    if params[:genre_name].empty?
      @song.genres << Genre.find_by_name(params[:genre].keys.first)
    else
      @song.genres.build(name: params[:genre_name])
    end

    @song.save
    redirect "/songs/#{@song.slug}?create=yes"
  end

  post '/songs/:slug/edited' do
    @song = Song.find_by_slug(params[:slug])

    if !params[:name].empty?
      @song.name = params[:name]
    end

    if !params[:artist_name].empty?
      @song.artist = Artist.find_or_create_by(name: params[:artist_name])
    end

    if !params[:genre]==nil
      @song.genres.clear
      params[:genre].keys.each do |k|
        @song.genres << Genre.find_by_name(k)
      end
    end

    @song.save

    redirect "/songs/#{@song.slug}?edit=yes"
  end
end
