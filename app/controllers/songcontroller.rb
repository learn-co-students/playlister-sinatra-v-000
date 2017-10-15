class SongController < ApplicationController


  get '/songs' do
    @songs = Song.all
    erb :'songs/songlist'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
    @song = Song.all
    @song = Song.create(name: params[:song_name])
    @song.artist = Artist.find_or_create_by(name: params[:artist_name])
    @song.genre_ids = params[:genres]
    @song.save

    flash[:message] = "Successfully created song."
    redirect to("/songs/#{@song.slug}")

  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.artist = Artist.find_or_create_by(name: params[:artist_name])
    if !params[:artist_name].empty?
    @song.genres = params[:genres].map {|g| Genre.find_by(name: g)}
    @song.save
    end
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end

end
