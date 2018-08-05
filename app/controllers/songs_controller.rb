class SongsController < ApplicationController

    get '/songs' do
        @songs = Song.all
        erb :'/songs/index'
      end

    get '/songs/new' do   
        @genres = Genre.all
        erb :'songs/new'  
    end

    post '/songs' do 
        binding.pry
        if !Artist.find_by(name: params[:artist])   
            artist = Artist.create(name: params[:artist])
            @song = Song.create(name: params[:name], artist_id: artist.id)
        else
            @song = Song.create(name: params[:name], artist_id: params[:artist].id)
        end
        @song.save
        redirect to "songs/#{@song.slug}"
      end

    get '/songs/:slug' do    
       @song = Song.find_by_slug(params[:slug])
       erb :'/songs/show'
    end

end