
class SongController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/songs' do
    erb :'songs/index'
  end

  post '/songs' do

    @genre = Genre.find_by(name: params['genre']['name'])
    @song_genre = SongGenre.find_or_create_by(genre_id: @genre.id)
    @artist = Artist.find_or_create_by(name: params['artist_name'])
    @song = Song.find_or_create_by(name: params["Name"], artist_id: @artist.id)
    @song_genre.song_id = @song.id
    @song.save
    @artist.save
    @song_genre.save
    redirect to "songs/#{@song.slug}"
  end

  post '/songs/:slug' do

    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find_or_create_by(name: params['artist'])
    @genre = Genre.find_by(id: params['genre'])
    @song.artist = @artist
    @song_genre = SongGenre.find_by(song_id: @song.id)
    @song_genre.genre = @genre

    @song_genre.save
    @song.save
    @artist.save
    redirect to "/songs/#{@song.slug}"

    binding.pry
    erb :'songs/index'

  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

end
