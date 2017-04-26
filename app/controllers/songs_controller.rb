class SongsController < ApplicationController
  set :views, Proc.new { File.join(root, "../views/songs/") }

  get '/' do
    erb :index
  end

  get '/songs' do
    @songs = Song.all
    erb :'/index'
  end

  get '/songs/new' do
    erb :new
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :show
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :edit
  end



  post '/songs' do
    song = Song.create(name: params[:song][:name])
    artistt = Artist.find_or_create_by(name: params[:song][:artist])
    song.genre_ids = params[:genres]
    song.artist = artistt
    song.save
    redirect to("/songs/#{song.slug}")
  end



end
