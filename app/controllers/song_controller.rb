class SongController < ApplicationController

  get '/songs' do
    @songs = Song.all.sort_by(&:name)
    erb :'songs/index'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @genre = Genre.all.find(SongGenre.all.find(@song.id).genre_id)
    erb :'songs/show'
  end
end
