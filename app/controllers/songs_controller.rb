require 'rack-flash'

class SongsController < ApplicationController
    use Rack::Flash
    get '/songs' do
        @songs = Song.all
        erb :'/songs/index'
    end
    
    post '/songs' do
        @song = Song.create(params[:song])
        @song.genres << Genre.find_by_id(params[:genres])
        !Artist.find_by_name(params[:artist][:name]) ? @song.artist = Artist.create(params[:artist]) : @song.artist = Artist.find_by_name(params[:artist][:name])
        @song.artist.save
        @song.save
        flash[:message] = "Successfully created song."
        redirect "/songs/#{@song.slug}" 
    end
    
    get '/songs/new' do
        erb :'songs/new'
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/show'
    end
    
    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/edit'
    end
    
    post '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        @song.artist.update(params[:artist]) if !params[:artist][:name].empty?
        if !params[:genres].nil?
            params[:genres].each do |x|
                @song.genres << Genre.find_by_id(x)
            end
        end
        @song.save
        flash[:message] = "Successfully updated song."
        redirect "/songs/#{@song.slug}"
    end

end
