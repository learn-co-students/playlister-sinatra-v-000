class SongsController < ApplicationController

    register Sinatra::Flash
    
    get '/songs' do
        @songs = Song.all

        erb:'/songs/index'
    end

    get '/songs/:slug/edit' do
        @artists = Artist.all
        @genres = Genre.all
        @song = Song.find_by_slug(params[:slug])
        
        erb :'/songs/edit'
    end

    get '/songs/new' do
        @genres = Genre.all
        @artists = Artist.all
        erb :'/songs/new'
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        # binding.pry
        
        erb :'/songs/show'
    end

    post '/songs' do 
    
        @song = Song.find_or_create_by(params["song"])

        if !params["artist"]["name"].empty? 
            @song.artist = Artist.find_or_create_by(name: params["artist"]["name"])
            @song.save
        end

        if !params["genre"]["genre_id"].empty?
            @song.genres << Genre.find(params["genre"]["genre_id"])
        end     

        if !params["genre"]["name"].empty? 
            @song.genres << Genre.find_or_create_by(name: params["genre"]["name"])
            @song.save
        end

        flash[:message] = "Successfully created song."      
        
        redirect "/songs/#{@song.slug}"
    end

    patch '/songs/:slug' do 
        @song = Song.find_by_slug(params[:slug])
      
        @song.update(params[:song])
      
        if !params["artist"]["name"].empty?
            @song.artist = Artist.find_or_create_by(name: params["artist"]["name"])
            @song.save
        end

        if !params["genre"]["genre_id"].empty?
            @song.genres << Genre.find(params["genre"]["genre_id"])
        end       

        if !params["genre"]["name"].empty? 
            @song.genres << Genre.find_or_create_by(name: params["genre"]["name"])
            @song.save
        end

        flash[:message] = "Successfully updated song."  

        redirect "songs/#{@song.slug}"
    end
end