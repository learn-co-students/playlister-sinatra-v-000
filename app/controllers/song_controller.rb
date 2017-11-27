require 'rack-flash'
require 'pry'

class SongController < ApplicationController
    use Rack::Flash
    
     get '/songs' do
        @songs=Song.all
        erb :"songs/index"
     end

     get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params["slug"])
        erb :"songs/edit"        
     end

     get '/songs/new' do
        erb :"songs/new"
    end

     get '/songs/:slug' do
        @song = Song.find_by_slug(params["slug"])
        
        erb :"songs/song"
     end

     post '/songs' do
        @song=Artist.find_or_create_by(:name => params["artist_name"]).songs.create(:name => params["name"])
        @song.genre_ids=params["genres"]
        flash[:notice] = "Successfully created song."
        redirect "/songs/#{@song.slug}"        
     end



     patch '/songs/:slug' do
        binding.pry
        @song = Song.find_by_slug(params["slug"])
        @song.update(:name => params["song"]["name"])
        @song.artist = Artist.find_or_create_by(params["artist"]["name"])
        @song.save
        
        flash[:message] = "Successfully updated song."

        redirect ("/songs/#{song.slug}")
        
     end

end