# require 'rack-flash'

class SongsController < ApplicationController
  # use Rack::Flash

  get '/songs' do
    @songs = Song.all
    # binding.pry
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    # binding.pry
    @song = Song.find_by_slug(params[:slug])
    # binding.pry
    erb :'songs/show'
  end

  post '/songs' do
    # "Your song is created"
    # binding.pry
    song = Song.create(params[:song])
    if !!(params[:artist][:id])
      song.artist = Artist.find(params[:artist][:id])
      # binding.pry
    else
      song.artist = Artist.find_or_create_by(params[:artist])
      # binding.pry
    end
    song.genres << Genre.find(params[:genres])
    song.save
    # binding.pry
    # flash[:message] = "Successfully created song."
    redirect "/songs/#{song.slug}"
  end



end
