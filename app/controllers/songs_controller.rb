require 'pry'
require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash


    get '/songs' do
    @songs = Song.all
    erb :'songs/index'
end

    get '/songs/new' do
        
        erb :'songs/new'
    end 

    post '/songs' do
        # if params["artist"]["name"].empty?
        # @artist = Artist.create(:name =>params["artist"]["name"])
            @song = Song.create(:name =>params["song"]["name"])
            @song.artist = Artist.create(:name => params["artist"]["name"])
            @song.genre_ids = params["genres"]
            @song.save
                flash[:message] = "Successfully created song."

        redirect to "/songs/#{@song.slug}"
    end



    get 'songs/:slug/edit' do

        redirect to "/songs/#{@song.slug}"
    end

    get '/songs/:slug' do
        
        @songs = Song.find_by_slug(params["slug"])
        
        erb :'songs/show'
    end


end