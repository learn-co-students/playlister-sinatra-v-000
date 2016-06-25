class SongsController < ApplicationController
    get '/songs' do
        @songs = Song.all
        erb :'/songs/index'
    end
    
    get '/songs/new' do
       erb :'/songs/new' 
    end   
    
    get '/songs/:slug/edit' do
        
       erb :'/songs/edit' 
    end    
    
    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/show'
    end
    
    post "/songs" do
        genres = params["genres"].collect {|genre_id| Genre.find(genre_id)}
       @song = Song.create(name: params["Name"], genres: genres)
        
        artist = Artist.find_or_create_by(name: params["Artist Name"])    
       @song.artist = artist
       @song.save
       flash[:message] = "Successfully created song."
       redirect to "/songs/#{@song.slug}"
    end
    
    patch '/songs/:slug' do
    end
end