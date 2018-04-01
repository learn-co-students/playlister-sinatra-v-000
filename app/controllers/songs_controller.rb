class SongsController < ApplicationController
   
   configure do 
    enable :sessions
    set :session_secret, "secret"
   end 

    get '/songs' do
        @songs = Song.all  
        erb :'/songs/index'
    end 
    
    get '/songs/new' do
        erb :'songs/new'
    end 

    post '/songs' do 
       puts params

        flash[:message] = "Successfully created a song!"
        redirect to("/songs/#{@song.slug}")
    end 

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/show' 
    end 

end 

