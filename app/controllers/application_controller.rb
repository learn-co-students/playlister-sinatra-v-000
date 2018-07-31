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
     @song = Song.create(name: params[:Name])
     if !params[:"Artist Name"].empty?
       @artist = Artist.create(name: params[:"Artist Name"])
       @song.artist_id = @artist.id
       @song.save
     else
       @artist = Artist.find_by_id(params[:artist][:id])
       @song.artist_id = @artist.id
       @song.save
     end

      @songgenre = SongGenre.create(song_id: @song.id, genre_id: params[:genres][0].to_i)
      @genre = Genre.find_by_id(@songgenre.genre_id)
     redirect to "/songs/#{@song.slug}"
   end

   get '/songs/:slug' do
     @song = Song.find_by_slug(params[:slug])
     @artist = Artist.find_by_id(@song.artist_id)
 binding.pry
     @songgenre = SongGenre.find_by_song_id(@song.id)
     @genre = Genre.find_by_id(@songgenre.genre_id)
     erb :actualsong
   end

   get '/artists/:slug' do
     @artist = Artist.find_by_slug(params[:slug])
     @artistsongs = []
     Song.all.each do |song|
       if song.artist_id == @artist.id
          @artistsongs << song.name
       end
     end
     @genreartists = []
     Genre.all.each do |song|
       if genre.artist_id == @artist.id
          @genreartists << genre.name
       end
     end
     erb :actualartist
   end

   get '/genres/:slug' do
     @genre = Genre.find_by_slug(params[:slug])
     erb :actualgenre
   end

end
