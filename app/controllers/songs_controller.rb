require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash

      get '/songs' do
        @songs = Song.all
        erb :"songs/index"
      end

      get '/songs/new' do
        erb :"songs/new"
      end

      post '/songs' do

        genre_name=Genre.find(params[:genre]).name
        song = Song.create(name: params[:name])
        genre = Genre.find_or_create_by(name: genre_name)
        artist = Artist.find_or_create_by(name: params[:artist])
        song.artist = artist
        song.song_genres.build(genre: genre)
        song.save
        flash[:message]= "Successfully created song."
        redirect("/songs/#{song.slug}")
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
        
        genre_name=Genre.find(params[:genre]).name
        song = Song.find_by_slug(params[:slug])
        if params[:name] != ""
          song.name = params[:name]
        end
        genre = Genre.find_or_create_by(name: genre_name)
        if params[:artist] != ""
        artist = Artist.find_or_create_by(name: params[:artist])
        song.artist = artist
        end

        song.song_genres.build(genre: genre)
        song.save
        flash[:message]= "Successfully updated song."

        redirect("/songs/#{song.slug}")
      end


end
