require 'sinatra/base'
require 'rack-flash'

class SongsController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions
  use Rack::Flash
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/songs' do
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  post '/songs/new' do

    artist = Artist.find_or_create_by(name: params[:artist_name])

    @song = Song.create(
    name: params[:song_name],
    artist_id: artist.id,
    genre_ids: params[:genres])

    flash[:message] = "Successfully created song."

    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.all.find_by_slug(params[:slug])

    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.all.find_by_slug(params[:slug])

    if !params[:artist_name].empty?
      artist = Artist.find_or_create_by(name: params[:artist_name])
    else
      artist = @song.artist
    end
    
    @song.update(artist_id: artist.id, genre_ids: params[:genres])

    flash[:message] = "Successfully updated song."

    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.all.find_by_slug(params[:slug])
    erb :'songs/show'
  end

end
