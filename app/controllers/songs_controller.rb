class SongsController < ApplicationController
enable :sessions
use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(name: params[:song][:name])
    artist = Artist.find_or_create_by(params[:artist])
    artist.songs << @song
    @song.genre_ids = params[:song][:genre_ids]
    @song.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end



  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end



end
