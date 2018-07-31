require 'pry'
class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  get '/songs' do
    erb :songs_view
  end

  get '/artists' do
    erb :artists_view
  end

  get '/genres' do
    erb :genres_view
  end

  get '/songs/new' do
    erb :createsongs
  end

  post '/songs' do
     @song = Song.create(name: params[:song_name])
     if !artist_name.empty?
       @artist = Artist.create(name: params[:artist_name])
       @song.artist_id = @artist.id
     else
       @artist = Artist.find_by_id(params[:artist][:id])
       @song.artist_id = @artist.id
     end
      @songgenre = SongGenre.find_by_song_id(@song.id)
      @genre = Genre.find_by_id(params[:genre][0].to_i)
      @songgenre.genre_id = @genre.id
     binding.pry
     redirect to "/songs/#{@song.slug}"
   end

   get '/songs/:slug' do

     erb :actual_song
   end

end
