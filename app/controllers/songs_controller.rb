# require 'rack-flash'

class SongsController < ApplicationController

    get '/songs' do
        @songs = Song.all
    erb:'/songs/index'
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
    erb:'songs/show'
    end

    post '/songs' do
        @song = Song.create(:name => params['name'])
        @song.artist = Artist.find_or_create(params[:slug])
        @song.genre_ids = params[:genres]
        @song.save
        redirect to '/songs/#{@song.slug}'
    end
end

