class SongsController < ApplicationController
    # Pay attention to the order of /songs/new and /songs/:slug. The route /songs/new could interpret new as a slug if that controller action isn't defined first.
    get '/songs' do
        @songs = Song.all  
        erb :'/songs/index'
    end 
    
    get '/songs/new' do 
    end 

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/show' 
    end 

end 

