class GenresController < ApplicationController

  get '/genres' do
    erb :'/genres/index'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    @song_id = SongGenre.all.find(@genre.id).song_id
    @song = Song.all.find(@song_id)
    @artist = Artist.all.find(@genre.id)

    erb :'/genres/show'
  end

end
