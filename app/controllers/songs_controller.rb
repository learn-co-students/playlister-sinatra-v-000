require 'rack-flash'
class SongsController < ApplicationController
    use Rack::Flash

    get '/songs' do
        @songs = Song.all
        erb :'/songs/index'
    end

    get '/songs/new' do
        @genres = Genre.all
        erb :'songs/new'
    end

    post '/songs' do

        @song = Song.new(name: params[:song][:name])
        @artist = Artist.find_by(name: params[:song][:artist][:name])
        if @artist
            @song.artist = @artist
        else
            @song.artist = Artist.new(name: params[:song][:artist][:name])
        end
        params[:genres].each do |genre_id|
            genre = Genre.find(genre_id)
            @song.genres << genre
        end
        @song.save
        flash[:message] = "Successfully created song."
        redirect "/songs/#{@song.slug}"
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/show'
    end

    get '/songs/:slug/edit' do
        @genres = Genre.all
        @song = Song.find_by_slug(params[:slug])
        erb :'songs/edit'
    end

    post '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        @song.name = params[:song][:name]
        @artist = Artist.find_by(name: params[:song][:artist][:name])
        if @artist
            @song.artist = @artist
        else
            @song.artist = Artist.new(name: params[:song][:artist][:name])
        end
        params[:genres].each do |genre_id|
            genre = Genre.find(genre_id)
            @song.genres << genre
        end
        @song.save
        flash[:message] = "Successfully updated song."
        redirect "/songs/#{@song.slug}"
    end
end
