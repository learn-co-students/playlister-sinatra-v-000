class SongsController < ApplicationController
  require 'rack-flash'
  use Rack::Flash

  get '/songs' do
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do
    artist= Artist.find_or_create_by(name: params["Artist Name"])
    song = Song.create(name: params["song_name"], artist: artist)
    song.genre_ids=params["genre"]
    song.save
    #binding.pry
    @song = song
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
    #binding.pry
  end

end
