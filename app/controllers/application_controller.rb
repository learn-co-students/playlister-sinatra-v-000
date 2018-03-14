require 'rack-flash'
class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions
  use Rack::Flash
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  get '/songs' do
    @songs = Song.all
    erb :songs
  end

  get '/songs/new' do
    genre = Genre.create(name: "Pop")
    erb :new
  end

  post '/songs/' do
    @song = Song.create(params["song"])
    artist = Artist.all.find{|artist| artist.name == params[:artist][:name]}
    if artist
      @song.artist = artist
    else
      artist = Artist.create(name: params[:artist][:name])
      @song.artist = artist
    end
    params[:genres].each {|genre_id| @song.song_genres.create(genre_id: genre_id.to_i)}
    @song.save
    flash[:message] = "Successfully created song."
    redirect to("/songs/#{@song.slug}")
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :show_song
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :edit
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(name: params[:song][:name])
    artist = Artist.all.find{|artist| artist.name == params[:artist][:name]}
    if artist
      @song.update(artist_id: artist.id)
    else
      artist = Artist.create(name: params[:artist][:name])
      @song.update(artist_id: artist.id)
    end
    params[:genres].each {|genre_id| @song.song_genres.create(genre_id: genre_id.to_i) unless @song.song_genres.genre_id.include?(genre_id.to_i)}
    @song.save
    erb :show_song
  end

  get '/artists' do
    @artists = Artist.all
    erb :artists
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :show_artist
  end

  get '/genres' do
    @genres = Genre.all
    erb :genres
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :show_genre
  end
end
