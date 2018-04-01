require 'rack-flash'

class SongsController < ApplicationController
    use Rack::Flash

    get '/songs' do
        @songs = Song.all  
        erb :'/songs/index'
    end 
    
    get '/songs/new' do
        erb :'songs/new'
    end 

    post '/songs' do 
        @song = Song.create(name: params[:name])
        @song.artist = Artist.find_or_create_by(name: params['artist'])
        @song.save
        @song.genre_ids = params[:genres]

        flash[:message] = "Successfully created song."

        redirect to("/songs/#{@song.slug}")
    end 

    get '/songs/:slug/edit' do 
        erb :'/songs/edit'
    end 

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/show' 
    end 



    patch '/songs/:slug' do 
        puts "i'm in the patch route"
    end 

end 

