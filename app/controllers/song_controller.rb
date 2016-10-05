class SongController < ApplicationController

  get '/songs' do
    erb :'/songs/song_index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/song_show'
  end

  post '/songs' do
    @song = Song.create(params[:song])
    @artist = Artist.find_or_create_by(name: params[:artist])
    @song.artist = @artist
    @song.genres = Genre.find(params[:genres])
    @song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    if !params[:artist].empty?
      @song.artist = Artist.find_or_create_by(name: params[:artist])
    end
    @song.update(genres: Genre.find(params[:genres]))
    @song.save
    flash[:message] = "Successfully updated song."
    erb :'/songs/song_show'
  end

end
