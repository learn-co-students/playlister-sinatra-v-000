require 'rack-flash'
class SongsController < ApplicationController
    
    enable :sessions
    
    use Rack::Flash
    
    get '/songs' do
        @songs = Song.all
        erb :'/songs/index'
    end
    get '/songs/new' do
        erb :'songs/new' 
    end
    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/show'
    end



    post '/songs' do 
        
        @artist = Artist.find_or_create_by(params[:artist])
        @artist.save
        @song = Song.find_or_create_by(name: params[:song][:name])
        
        @artist.songs << @song unless @artist.songs.include?(@song)
        
        Genre.all.each do |genre|
            if params[:genres].include?(genre.id.to_s)

                @song.genres << genre unless @song.genres.include? (genre)
                genre.save
            end
        end
        flash[:message] = "Successfully created song."
        
        redirect "/songs/#{@song.slug}"
    end

    get 'songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/edit'
    end


end