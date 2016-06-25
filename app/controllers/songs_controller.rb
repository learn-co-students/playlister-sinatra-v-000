class SongsController < ApplicationController
    get '/songs' do
        @songs = Song.all
        erb :'/songs/index'
    end
    
    get '/songs/new' do
       erb :'/songs/new' 
    end
    
    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/show'
    end    
    
    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])    
       erb :'/songs/edit' 
    end    
    
    post "/songs" do
       @song = Song.create(name: params["Name"])
       @song.genre_ids = params["genres"]    
        
        artist = Artist.find_or_create_by(name: params["Artist Name"])  unless params["Artist Name"].empty?  
       @song.artist = artist
       @song.save
       flash[:message] = "Successfully created song."
       redirect to "/songs/#{@song.slug}"
    end
    
    patch '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        @song.name = params["Name"] unless params["Name"].empty?
        @song.genre_ids = params["genres"]
        @song.artist = Artist.find_or_create_by(name: params["Artist Name"])  unless params["Artist Name"].empty?
        @song.save
        flash[:message] = "Successfully updated song."
        redirect "/songs/#{@song.slug}"
    end
end