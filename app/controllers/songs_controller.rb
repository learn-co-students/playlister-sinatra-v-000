class SongsController < ApplicationController
use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    @artist = Artist.find_or_create_by(name: params[:artistname])
    @song = Song.create(name: params[:songname])
    @song.artist = @artist
    @song.save
    SongGenre.create(genre_id: params[:genre].to_i, song_id: @song.id, artist_id: @artist.id )
    flash[:message] = "Successfully created song."
    redirect to("/songs/#{@song.slug}")

  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.artist.update(params[:artist]) unless params[:artist][:name].empty?
    @song.song_genres.update(params[:genre])
    #binding.pry
    flash[:message] = "Successfully updated song."
    redirect to("/songs/#{@song.slug}")
  end

end
