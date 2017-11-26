require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do #view all songs
    @songs = Song.all
    erb :'/songs/index'
  end

  post '/songs' do #create action and creates new song based on the params from the form, saves it to db, and redirects
    @song = Song.create(:name => params["Name"])
    @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
    @song.genre_ids = params[:genres]
    @song.save
      flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/new' do #load the form to create a new song
    erb :'/songs/new'
  end

  get '/songs/:slug' do #view instance of song through slug
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do #load edit form
    @song = Song.find_by_slug(params[:slug])
    @artists = Artist.all
    @genres = Genre.all
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do #edit action
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.save
      flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end
end
