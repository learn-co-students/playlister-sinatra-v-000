class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @genres = []
    @song.song_genres.each do |genre|
      @genres << Genre.find(genre.genre_id)
    end
    erb :'songs/show'
  end

end
