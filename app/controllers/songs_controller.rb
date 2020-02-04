require 'sinatra/base'
require 'rack-flash'

class SongsController < ApplicationController

    enable :sessions 
    use Rack::Flash

    get '/songs' do
        @songs = Song.all
        erb :'/songs/index'
    end

    get '/songs/new' do
        erb :'/songs/new'
    end

    get '/songs/:slug' do 
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/show'
    end

    post '/songs' do 
        @song = Song.create(:name => params["Name"])
        @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
        @song.save
        @song.genre_ids = params[:genres]
        
        flash[:message] = "Successfully created song."
        redirect to "/songs/#{@song.slug}"
    end

    get '/songs/:slug/edit' do 
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/edit'
    end

    patch '/songs/:slug' do 
        @song = Song.find_by_slug(params[:slug])
        @song.name = params["Name"]
        @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
        @song.save
        @song.genre_ids = params[:genres]
        
        flash[:message] = "Successfully updated song."
        erb :'/songs/show'
    end



end
