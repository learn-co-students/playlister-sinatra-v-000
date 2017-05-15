require 'rack-flash'
require 'sinatra/base'

class SongsController < ApplicationController
 
  use Rack::Flash

  get '/songs' do
    @songs = Song.all

    erb :'/songs/index' 
  end

  get '/songs/new' do 


    erb :'songs/new'  

  end

  get '/songs/:slug' do
    
    @genres = []

    @song = Song.find_by_slug(params[:slug])

    @artist = Artist.find_by_id(@song.artist_id)
    @genres << Genre.find_by_id(@song.genre_ids)

    erb :'songs/show'
  end

   post '/songs' do 
    
    @song = Song.create(params[:song])
    @song.artist = Artist.find_or_create_by(:name => params["artist"]["name"])

    @song.genre_ids = params[:genres]
    @song.save

    flash[:message] = "Successfully created song."

    redirect to("/songs/#{@song.slug}")

  end

  get '/songs/:slug/edit' do  #load edit form
    
     @song = Song.find_by_slug(params[:slug])
     @artist = Artist.find_by_id(@song.artist_id)
     @genres = []
      @song.genre_ids.each do |g|
        @genres << Genre.find_by_id(g)

      end

      erb :'songs/edit'
  end

   patch '/songs/:slug' do
    
   @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.save
    flash[:message] = "Successfully updated song."
     redirect("/songs/#{@song.slug}")
  end



  

 

  


  
end
