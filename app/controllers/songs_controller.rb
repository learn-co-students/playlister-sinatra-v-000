require 'rack-flash'

class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    #Shows a list of all songs.
    #Songs will be clickable.
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(:name => params["Name"])
    @song.genre_ids = params[:genres]
    @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
    @song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    #Has links to Artist and Genre.
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist
    @genres = @song.genres
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @slug = params[:slug]
    @song = Song.find_by_slug(@slug)
    erb :'/songs/edit'
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.save

    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end
end
