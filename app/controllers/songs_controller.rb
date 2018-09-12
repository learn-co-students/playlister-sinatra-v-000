require 'rack-flash'

class SongsController < ApplicationController
    enable :sessions
    use Rack::Flash

    get '/songs' do 
        @songs = Song.all

        erb :"songs/index"
    end

    get '/songs/new' do
        
        
        erb :"songs/new"
    end

    post '/songs' do
        
        @artist_found = Artist.find_by_name(params[:artist_name])
        @song_found = Song.find_by_name(params[:song_name])

        # if @song_found == "" || (@artist_found && @song_found) || !params.has_key?("genres")
        #     redirect to '/error' 
        
        if @artist_found
            
            @song = Song.create(name: params[:song_name])
            params[:genres].each do |genre_id|
                @song.genres << Genre.find_by_id(genre_id)
                end
            @song.artist = @artist_found
            
            @song.save
        else
            new_artist = Artist.create(name: params[:artist_name])
            @song = Song.create(name: params[:song_name])
            params[:genres].each do |genre_id|
                @song.genres << Genre.find_by_id(genre_id)
                end
            @song.artist = new_artist
            @song.save            
        end

        flash[:message] = "Successfully created song."

        redirect to "/songs/#{@song.slug}"
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        
        erb :"songs/show"
    end

    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        
        erb :"songs/edit"
    end

    patch '/songs/:slug' do
        binding.pry
        #Change artist name
        @song = Song.find_by_slug(params[:slug])
        @song.artist = Artist.find_or_create_by(:name => params[:artist_name])
        binding.pry

        flash[:message] = "Successfully updated song."
        erb :"songs/#{@song.slug}"
    end


    
end