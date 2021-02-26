require 'rack-flash'


class SongsController < ApplicationController
    use Rack::Flash

    get '/songs' do
        @songs = Song.all
        erb :'/songs/index'
    end

    get '/songs/new' do
        @genre = Genre.all
        erb :'/songs/new'
    end
    #has to be before slug pages 

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/show'

    end

    post '/songs' do 
        #has to be after slug page since it redirects to it
        @song = Song.create(name: params[:song][:name])
        @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
        @song.genre_ids = params[:genres]
        @song.save
        
        flash[:notice] = "Successfully created song."
        redirect "/songs/#{@song.slug}"
    end


    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug]) 
        erb :'/songs/edit'
    end

    patch '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        @song.update(params[:song])
        @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
        @song.genre_ids = params[:genres]
        @song.save

        flash[:notice] = "Successfully updated song."
        redirect("/songs/#{@song.slug}")
    end

end