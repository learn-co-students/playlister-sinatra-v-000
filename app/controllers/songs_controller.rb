require 'pry'
require 'rack-flash'
class SongsController < ApplicationController
use Rack::Flash


  get '/songs' do 
    @songs = Song.all
    erb :'songs/index'  
  end

  get '/songs/new' do
    erb :'/songs/new'
  end 

  get '/songs/:slug' do

    @slug = params[:slug]
    @song = Song.find_by_slug(@slug)
    erb :'/songs/show'
  end

  post '/songs' do

    @song = Song.create(params[:song])
    @slug = @song.slug
    if !(params["artist"]["name"]).empty?
    @artist = Artist.find_or_create_by(name: params["artist"]["name"])
      @song.artist_id = @artist.id
    end
    if !(params["genre"]["name"]).empty?
      @song.genres << Genre.create(name: params["genre"]["name"])
    end
    @song.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@slug}"
  end

  get '/songs/:slug/edit' do
     
    @slug = params[:slug]
    @song =  Song.find_by_slug(@slug)
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    
    @slug = params[:slug]
    @song =  Song.find_by_slug(@slug)
    @song.genres.clear
    if !(params["artist"]["name"]).empty?
      @artist = Artist.create(name: params["artist"]["name"])
      @song.artist = @artist
    end
  
    if !(params["song"]["genre_ids"]).empty?
      (params["song"]["genre_ids"]).each do |genre| 
        added_genre = Genre.find(genre.to_i)
        @song.genres << added_genre
      end
    end
    if !(params["genre"]["name"]).empty?
      @song.genres << Genre.create(name: params["genre"]["name"])
    end

    @song.save
    flash[:message] = "Successfully updated song." 
    erb :'/songs/show'
  end
end

