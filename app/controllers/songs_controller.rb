require 'rack-flash'
class SongsController < ApplicationController

  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  post '/songs/new' do
    @song = Song.create(params[:song])
    artist = Artist.find_by(name: params[:artist][:name])
    if !params[:artist].empty? && !artist
      @song.artist = Artist.create(params[:artist])
    else
      @song.artist = artist
    end
    @song.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  post '/songs/edit/:id' do
    binding.pry
    #find the song from the db and instantitate it and assign it to @song
    #@song.artist = params[:song][:artist]
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end

end
