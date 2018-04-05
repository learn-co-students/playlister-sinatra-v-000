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
    #if there is a params[:song][:name]
      #then use the name to search for the artist
      #if the artist doesn't exit then create the artist
      #else return the artist instance and assign it to @artist
    #if there is an artist_id (params[:song][:artist_id])
      #find the artist by id and set that artist equal to
      #@artist
    if params[:song][:name]
      @artist = Artist.find_by(name: params[:song][:artist])
      if !@artist
        @artist = Artist.create(name: params[:song][:artist])
      end
    elsif params[:song][:artist_id]
      @artist = Artist.find(params[:song][:artist_id])
    end
    @song = Song.find(params[:id])
=begin
    @artist = Artist.find_by(name: params[:song][:artist])
    if !@artist
      @artist = Artist.create(name: params[:song][:artist])
    end
=end
    @song.artist = @artist
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end

end
