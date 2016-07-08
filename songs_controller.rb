class SongsController < ApplicationController

    get '/songs' do
      erb :'songs/index'
    end

    get '/songs/:slug' do
      @song = Song.find_by_slug(params[:slug])
      @genre_id = SongGenre.find(@song.id).genre_id
      @genre = Genre.find(@genre_id)
      erb :'songs/show'
    end

end
