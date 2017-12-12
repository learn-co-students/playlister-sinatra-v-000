require 'rack-flash'

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
       @genres = @song.genres
       erb :'/songs/show'
    end
    
    post '/songs' do
       @artist_name = params["Artist Name"]
       @name = params["Name"]
       @genres = params["genres"]
       @song = Song.create(name: @name)
       
       @song.artist = Artist.find_or_create_by(name: @artist_name)
       @genres.each do |genre|
          song_genre = SongGenre.create(song_id: @song.id, genre_id: genre.to_i)
       end
       @song.save
       flash[:message] = "Successfully created song."
       redirect to "/songs/#{@song.slug}"
    end
    
    
    
end
