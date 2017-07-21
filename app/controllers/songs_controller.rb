require 'sinatra/base'
require 'rack-flash'

class SongsController < ApplicationController
    enable :sessions
    use Rack::Flash

    get '/songs/new' do
        erb :'songs/new'
    end
    
    post '/songs' do
        song = Song.find_or_create_by(params[:song])
        artist = Artist.find_or_create_by(params[:artist])
        song.artist = artist

        params[:genres].each { |genre_id|
            song.genres << Genre.find(genre_id.to_i)
        }
        song.save

        flash[:message] = "Successfully created song."

        redirect to "/songs/#{song.slug}"
    end

    get '/songs/:slug' do
        #binding.pry 
        @song = Song.find_by_slug(params[:slug])
        @artist = @song.artist
        @genres = @song.genres

        erb :'songs/show'
    end
    
    get '/songs' do
        @songs = Song.all
        erb :'songs/index'
    end
    
    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        @artist = @song.artist
        @genres = @song.genres

        erb :'songs/edit'
    end

    patch '/songs/:slug' do

        song = Song.find_by_slug(params[:slug])
        artist = Artist.find_or_create_by(params[:artist])
   
        song.genres.destroy

        song.artist = artist
        params[:genres].each { |genre_id|
            song.genres << Genre.find(genre_id.to_i)
        }
        song.save

        flash[:message] = "Successfully updated song."

        redirect to "/songs/#{song.slug}"

    end
end