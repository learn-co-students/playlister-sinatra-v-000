require 'rack-flash'

class SongsController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions
  use Rack::Flash
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
    song = Song.new(params[:song])
    genre_names = params[:genres].collect {|k, genre_name| genre_name}
    genre_names.each {|genre_name| song.genres << Genre.find_by(name: genre_name)}
    song.save
    artist = Artist.find_or_create_by(name: params[:artist][:name])
    artist.songs << song
    artist.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @genres = Genre.all
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/edit"
  end

  patch '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])
    song.update(name: params[:song][:name]) if params[:song][:name] != ""
    song.genres.clear
    genre_names = params[:genres].collect {|k, genre_name| genre_name}
    genre_names.each {|genre_name| song.genres << Genre.find_by(name: genre_name)}
    song.save
    if params[:artist][:name] != ""
      artist = Artist.find_or_create_by(name: params[:artist][:name])
      artist.songs << song
      artist.save
    end
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{song.slug}"
  end

end
