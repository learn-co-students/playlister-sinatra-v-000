require 'rack-flash'

class SongsController < ApplicationController
    use Rack::Flash
    get '/songs' do
        @songs = Song.all
        erb :'/songs/index'
      end

    get '/songs/new' do   
        @genres = Genre.all
        erb :'songs/new'  
    end

    post '/songs' do 
        if !Artist.find_by(name: params[:song][:artist])   
            artist = Artist.create(name: params[:song][:artist])
            @song = Song.create(name: params[:song][:name], artist_id: artist.id)
        else
            @song = Song.create(name: params[:song][:name], artist_id: Artist.find_by(name: params[:song][:artist]).id)
        end

        genre_picked = params[:song][:genres]
        genre_picked.each do |genre|
          @song.genres << Genre.find(genre)
        end
    
        @song.save
        flash[:message] = "Successfully created song."
        redirect to "songs/#{@song.slug}"
      end

    get '/songs/:slug' do 
       @song = Song.find_by_slug(params[:slug])
       erb :'/songs/show'
    end



    patch '/songs/:slug' do
        song = Song.find_by_slug(params[:slug])
        song.name = params[:song][:name]
        artist_name = params[:song][:artist]
        if Artist.find_by(:name => artist_name)
          if song.artist.name != artist_name
            song.artist = Artist.find_by(:name => artist_name)
          end
        else
          song.artist = Artist.create(:name => artist_name)
        end
        if song.genres
          song.genres.clear
        end
        genres = params[:song][:genres]
        genres.each do |genre|
          song.genres << Genre.find(genre)
        end
        song.save
        flash[:message] = "Successfully updated song."
        redirect to "songs/#{song.slug}"
    end

    get '/songs/:slug/edit' do   
        @song = Song.find_by_slug(params[:slug])
        @genres = Genre.all
        erb :'/songs/edit'
    end
      
end