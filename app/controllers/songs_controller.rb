# require 'pry'

# require 'rack-flash'
# enable :sessions
# use Rack::Flash
# require 'sinatra/flash'

class SongsController < ApplicationController
   
# configure do
#  enable :sessions
#  set :session_secret, "secret"
# end

# use Rack::Flash
# binding.pry

    get '/songs' do
        @songs = Song.all
        erb:'/songs/index'
    end

    get '/songs/new' do
        erb:'/songs/new'
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        # binding.pry
        erb :'/songs/show'
    end
    
    post '/songs' do
        @song = Song.create(:name => params['Name'])
        # binding.pry
        @song.artist = Artist.find_or_create_by(:name => params['Artist Name'])
        
        @song.genre_ids = params[:genres]
        @song.save
        # flash[:message] = "Successfully created song."
        puts "Successfully updated song."
        redirect("/songs/#{@song.slug}")
    end

    
    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        erb:'/songs/edit' 
        end

    patch '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        @song.update(params[:song])
        # @song.artist = Artist.find_or_create_by(:name => params[:artist][:name])
        @song.save
        @song.artist = Artist.find_by(:name => params[:artist][:name])
        @song.artist.update(params[:artist][:name])
        @song.artist.save
        # flash[:message] = "Successfully updated song."
        redirect("/songs/#{@song.slug}")
      end
end

#WHY GENRE_IDS PLURAL? (SONG CONTROLLER AND SONG.SHOW)