require 'rack-flash'

class SongsController < ApplicationController
    use Rack::Flash


    get '/songs' do
        @song = Song.all

        erb :'song/index'
    end

    get '/songs/new' do

        erb :'song/new'
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        
        erb :'song/show'
    end

    post '/songs' do
        @song = Song.create(:name => params[:song][:name])
        @song.artist = Artist.find_or_create_by(:name => params[:artist][:name])
        @song.genre_ids = params[:song][:genre_ids]
        @song.save

        flash[:message] = "Successfully created song."
        
        redirect to "/songs/#{@song.slug}"
    end

    get '/songs/:slug/edit' do
        @song = Song.find_by_slug(params[:slug])

        erb :'song/edit'
    end

    patch '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        @song.artist = Artist.find_or_create_by(:name => params[:artist][:name])
        @song.genre_ids = params[:song][:genre_ids]
        @song.save

        flash[:message] = "Successfully updated song."

        redirect to "/songs/#{@song.slug}"
    end

end
