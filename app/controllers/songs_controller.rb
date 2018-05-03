require 'rack-flash'



class SongsController < ApplicationController

  enable :sessions
  use Rack::Flash



  get '/songs' do
      @songs = Song.all
      erb :'songs/index'
    end

    get '/songs/new' do

      erb :'/songs/new'
    end

    get '/songs/:slug' do
      #binding.pry
      @song = Song.find_by_slug(params[:slug])
      erb :'/songs/show'
    end

    post '/songs' do
      @song = Song.create(name:params[:song][:name])
      @song.artist = Artist.find_or_create_by(:name => params["artist"])
      @song.genre_ids = params[:genre_ids]
      @song.save

      flash[:message] = "Successfully created song."

#binding.pry
      redirect to("/songs/#{@song.slug}")
    end
# use in console to delete empty songs -> Artist.all.select{|artist| artist unless artist.name}.each do |artist| artist.destroy end

    get '/songs/:slug/edit' do
      @song = Song.find_by_slug(params[:slug])
      erb :'/songs/edit'
    end

    patch '/songs/:slug' do
      puts params
        @song = Song.find_by_slug(params[:slug])
        new_song = {name: params[:song][:name]}
        @song.update(new_song)
        new_artist = Artist.find_or_create_by(:name => params[:artist][:name])
        @song.artist = new_artist
        @song.save
        flash[:message] = "Successfully updated song."
        redirect to("/songs/#{@song.slug}")
    end


    get '/songs/:id' do
      @song = Song.find(params[:id])
      erb :'/songs/show'
    end




end
