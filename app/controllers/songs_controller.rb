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
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    erb :'songs/show'
  end

  post '/songs' do
    song = Song.create(name: params[:song_name])
    song.artist = Artist.find_or_create_by(name: params[:artist_name])
    if !params[:genre][:name].empty?
      song.genres << params[:genres].collect {|g| Genre.find(g)}
      song.genres << Genre.create(name: params[:genre][:name])
    else
      song.genres << params[:genres].collect {|g| Genre.find(g)}
    end
    song.save

    flash[:message] = "Successfully created song."
    redirect "songs/#{song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])

    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])
    song.update(name: params[:song_name])

    if Artist.find_by(name: params[:artist_name]) != params[:artist_name]
      song.artist = Artist.create(name: params[:artist_name])
    else
      song.artist = params[:artist_name]
    end

    if song.genres
      song.genres.clear
    end

    if !params[:genre][:name].empty?
      song.genres << params[:genres].collect {|g| Genre.find(g)}
      song.genres << Genre.create(name: params[:genre][:name])
    else
      song.genres << params[:genres].collect {|g| Genre.find(g)}
    end
    song.save

    flash[:message] = "Successfully updated song."
    redirect "songs/#{song.slug}"
  end
end
