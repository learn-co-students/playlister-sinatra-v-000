class GenreController < Sinatra::Base

  set :views, 'app/views'

  get '/genres' do
    @genres = Genre.all
    erb :"genres/index"
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    @song = Song.find_by(id: SongGenre.find_by(genre_id: @genre.id))
    @artist = Artist.find_by(@song.artist_id)
    #
    erb :"genres/show"
  end

end
