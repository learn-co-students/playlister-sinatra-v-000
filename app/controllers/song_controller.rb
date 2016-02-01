require 'pry'
class SongController < Sinatra::Base
  set :views, 'app/views'

  get '/songs' do
    @songs = Song.all
    erb :"songs/index"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find_by(@song.artist_id).name
    @genre = Genre.find_by(SongGenre.find_by(@song.id).genre_id).name
    @artist_slug = Artist.find_by(@song.artist_id).slug
    @genre_slug = Genre.find_by(SongGenre.find_by(@song.id).genre_id).slug
    erb :"songs/show"
  end


end
