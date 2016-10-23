class SongController < ApplicationController
    
    get '/songs' do 
        erb :'song/index'
    end
    
    get '/songs/new' do 
        erb :'song/new'
    end

    post '/songs/new' do 
        binding.pry
    end
    
    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'song/show'
    end
    
end