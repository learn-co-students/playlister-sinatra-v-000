require 'rack-flash'
class SongsController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs' do
    song_params = params[:song]
    artist_params = params[:artist]
    genre_params = params[:genre]
    song_slug = song_params[:name].split(" ").map(&:downcase).join(" ")
    artist_slug = artist_params[:name].split(" ").map(&:downcase).join(" ")
    @song = Song.find_or_create_by(song_params)
    @song.artist = Artist.find_or_create_by(artist_params)
    @song.genres << Genre.find(params[:genres])
    @song.save
    flash[:message] = "Successfully created song."

    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @genres = Genre.all
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  post '/songs/:id' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    @song.artist.update(params[:artist])
    if !params[:genre].empty?
      @song.genres.clear
      @song.genres << Genre.find(params[:genres])
    end
    flash[:message] = "Successfully updated song."

    redirect to "/songs/#{@song.slug}"
  end
end
