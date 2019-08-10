require 'rack-flash'

class SongsController < ApplicationController

  use Rack::Flash
  set :method_override, true

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    @artists = Artist.all
    erb :'/songs/new'
  end

  post '/songs' do
    @genres = Genre.all
    artist_match = Artist.find {|artist|
      artist.name == params["Artist Name"]}
    if artist_match == nil
      @artist = Artist.create(:name => params["Artist Name"])
    else
      @artist = artist_match
    end
    @song = Song.create(:name => params[:Name],
    :artist => @artist)
    flash[:message] = "Successfully created song."
    params[:genres].each do |genre_id|
        @song.genres << Genre.find(genre_id)
        @song.save
    end
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    #@genres = Genre.all
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    @song.artist = Artist.find_or_create_by(name:params[:artist][:name])
    @song.genre_ids = params[:genres]
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end

  # patch '/songs/:slug' do
  #   @song = Song.find_by_slug(params[:slug]) 
  #   @song.update(params[:song]) 
  #   @song.artist = Artist.find_or_create_by(name:params[:artist][:name]) 
  #   @song.genre_ids = params[:genres] 
  #   @song.save  
  #   flash[:message] = "Successfully updated song." 
  #   redirect to "/songs/#{@song.slug}" 
  # end
end
