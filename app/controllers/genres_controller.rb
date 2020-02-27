class GenresController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/genres' do
    @genres = Genre.all
    erb :'/genres/index'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    song_genre = SongGenre.find_by(genre_id: @genre.id)
    @song = Song.find_by_id(song_genre.id)

    @artist = Artist.find_by_id(@song.artist_id)
    erb :'/genres/show'
  end
end