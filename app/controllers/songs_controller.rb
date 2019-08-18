require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash
  
  get '/songs' do
    @songs = Song.all
    erb :"songs/index"
    # This helped with the syntax above: https://stackoverflow.com/questions/2129504/sinatra-sub-directory-views
  end

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :"songs/new"
  end
  
  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/show"
  end

  post '/songs' do
    binding.pry
    song = Song.create(params[:song])
    song.artist = Artist.find_or_create_by(params[:artist])
    song.save
    
    flash[:message] = "Successfully created song."
    # See https://github.com/treeder/rack-flash#sinatra for how to use Rack Flash.
    # Note: I still need to see how to display flash.now messages

    redirect to "/songs/#{song.slug}"

    #-----Earlier code, when certain params had different names-----
    # song = Song.new(name: params[:name])
    # song.genre_ids = params[:genres]
    # song.artist = Artist.create(name: params[:artist_name])
    # song.save
  end
  
end
