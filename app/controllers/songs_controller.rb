class SongsController < ApplicationController

  get '/songs' do 
    @songs = Song.all 
    erb :'/songs/index'
  end

  get '/songs/new' do
    @artists = Artist.all 
    @genres = Genre.all 
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do
    puts params 
    @song = Song.new
    @song.name = params[:song_name]
    @song.genres = params[:genres].map {|genre| Genre.find_by(name: genre)}
       if Artist.find_by(name: params[:artist_name]).nil?
         @song.create_artist(name: params[:artist_name])
       else
         @song.artist = Artist.find_by(name: params[:artist_name])
       end
     @song.save

     flash[:message] = "Successfully created song."

     redirect "/songs/#{@song.slug}"
  end


  

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all 
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
 
     @song = Song.find_by_slug(params[:slug])
 
     @song.artist = Artist.find_or_create_by(name: params[:artist_name]) if !params[:artist_name].empty?
 
     @song.genres = params[:genres].map {|genre| Genre.find_by(name: genre)}
 
     @song.save
 
     flash[:message] = "Successfully updated song."
     redirect  "/songs/#{@song.slug}"
   end

  
end