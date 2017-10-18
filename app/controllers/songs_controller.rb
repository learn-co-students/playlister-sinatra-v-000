class SongsController < ApplicationController
use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :"/songs/index"
  end

  get '/songs/new' do
    erb :"/songs/new"
  end

  post '/songs' do
    @song = Song.create(name: params["Name"])
    artist = Artist.find_by(name: params["Artist Name"])
      if artist
        @song.artist = artist
      else
        artist = Artist.create(name: params["Artist Name"])
        @song.artist = artist
      end
    @song.genre_ids = params["genres"]
    @song.save
    flash[:message] = "Successfully created song."
    redirect to ("/songs/#{@song.slug}")
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :"/songs/edit"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :"/songs/show"
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(name: params["Name"])
    @song.update(genre_ids: params["genres"])
    artist = Artist.find_by(name: params["Artist Name"])
      if artist
        @song.update(artist: artist)
      else
        artist = Artist.create(name: params["Artist Name"])
        @song.update(artist: artist)
      end
      @song.save
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end

end
