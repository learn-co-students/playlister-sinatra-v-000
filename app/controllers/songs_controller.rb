require "rack-flash"

class SongsController < ApplicationController
  use Rack::Flash


  get '/songs' do 
    @songs = Song.all
    erb :'songs/index'
  end

   get '/songs/new' do 
    erb :'/songs/new'
  end

  post '/songs' do 
    @song = Song.create(name: params[:song][:name])
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.genre_ids = params[:genres]
    @song.save

    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do 
    @song = Song.find_by_slug(params[:slug])
    
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do 
    @song = Song.find_by_slug(params[:slug])

    erb :'/songs/edit'
  end


  post '/songs/:id' do 
    @song = Song.find_by(id: params[:id])
    @song.update(name: params[:song][:name], 
      artist: Artist.find_or_create_by(name: params[:artist][:name]),
      genre_ids: params[:genres])

    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"

  end
  


end