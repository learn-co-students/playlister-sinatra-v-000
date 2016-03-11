class SongsController < ApplicationController



  get '/songs' do
    erb :'/songs/index', locals: {message: "Successfully created song."}
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    erb :'songs/show', locals: {message: "Song successfully updated."}
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    if !params[:artist_name].empty?
      artist = Artist.find_or_create_by(name: params[:artist_name])
      artist.songs << @song
    end
    if !!params[:genres]
      @song.genres.clear
      @song.genres << Genre.find_or_create_by(id: params[:genres])
    end
    @song.save
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  post '/songs' do
    @song = Song.create(name: params[:song_name])
    @song.genres << Genre.find(params[:genres])
    if !params[:artist_name].empty?
      artist = Artist.create(name: params[:artist_name])
      artist.songs << @song
    end
    @song.save
    redirect "/songs"
  end




end
