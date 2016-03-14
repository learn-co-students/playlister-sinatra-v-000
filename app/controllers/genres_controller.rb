class GenresController < Sinatra::Base
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/genres' do
    erb :'genres/index'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    @songs = @genre.songs
    # binds = @songs.map{|s| SongGenreBind.find_by(song_id: s.id)}
    # @genres = binds.map{|b| Genre.find(b[:genre_id])}
    @artists = @genre.artists
    erb :'genres/show'
  end
end
