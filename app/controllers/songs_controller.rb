require 'rack-flash'
class SongsController < ApplicationController
  configure do

    enable :sessions

  end
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :"songs/index"
  end
  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(name: params["song_name"])

    artist = Artist.find_or_create_by(name: params["artist_name"])

    if artist
      @song.artist = artist
    end

    @song.genre_ids = params[:genres]
    @song.save

    flash[:message] = "Successfully created song."

    redirect "/songs/#{@song.slug}"
end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
       erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist
  #  binding.pry
      erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    #binding.pry
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    @song.artist = Artist.find_or_create_by(name: params[:song][:artist])
    @song.genre_ids = params[:genres]
    @song.save

    redirect "/songs/#{@song.slug}"
  end



end
