class ArtistsController < ApplicationController

  get '/artists' do
    erb :'artists/index'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    @song = Song.all.find(@artist.id)
    @genre_id = SongGenre.all.find(@song.id).genre_id
    @genre = Genre.find(@genre_id)
    erb :'artists/show'
  end


end
