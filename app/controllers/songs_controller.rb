require 'rack-flash'

class SongsController < ApplicationController
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  use Rack::Flash


    get '/songs' do
      @songs = Song.all
      erb :'songs/index'
    end

    get '/songs/new' do
      @genres = Genre.all
      erb :'/songs/new'
    end

    get '/songs/:slug' do
      slug = params[:slug]
      @song = Song.find_by_slug(slug)
      @genres = Genre.all
      erb :'songs/show'
    end


    post '/songs' do

      @song = Song.create(name: params[:song][:name]) #create a new song using the name entered

      @artist = Artist.all.find_by(name: params[:song][:artist][:name]) #look for that artist entered in our Artist class by name and set to a variable @artist

        if @artist == nil #if no matching artist was found
          @artist = Artist.create(params[:song][:artist]) #create a new artist using the name entered CHECK THIS PARAMS HASH and set to instance variable @artist
          @song.artist_id = @artist.id #associate the song and the new artist
          @artist.songs << @song
          @song.save #save the association
        else #if an artist WAS found in our DB
          @song.artist_id = @artist.id #associate the song to the artist
          @song.save
        end

      @song.genres << Genre.all.find_by(id: params[:song][:genres]) #associate the song to the genre chosen
      @song.save

      flash[:message] = "Successfully created song."

      redirect "/songs/#{@song.slug}"
    end

    get '/songs/:slug/edit' do
      @song = Song.find_by_slug(params[:slug])
      @genres = Genre.all
      erb :'songs/edit'
    end

    patch '/songs/:slug' do
      binding.pry
      @song = Song.find_by_slug(params[:slug])
      @song.artist = Artist.create(name: params[:song][:artist][:name])

      params[:song][:genres].each do |genre_id|
        @genre = Genre.find_by(id: genre_id)
        @song.genres << @genre
      end

      @song.save

      flash[:message] = "Successfully updated song."

      redirect "/songs/#{@song.slug}"
    end


end
