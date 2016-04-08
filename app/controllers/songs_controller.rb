require 'pry'
class SongsController < ApplicationController

  get '/songs' do
    erb :"/songs/index"
  end

  get '/songs/new' do
    erb :"/songs/new"
  end

  post '/songs' do
    @song = Song.create(params[:song])
    if !params["artist"]["name"].empty?
      @artist = Artist.find_or_create_by(name: params["artist"]["name"])
      @song.artist = @artist
      @artist.songs << @song
      @artist.save
    end
    @song.save

    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    binding.pry    
    @song = Song.find_by_slug(params[:slug])
    erb :"/songs/show"
  end

end
