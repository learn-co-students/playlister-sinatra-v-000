class SongsController < ApplicationController

  get '/songs' do

      @songs = Song.all
      erb :'songs/index'
    end

    get '/songs/new' do

      erb :'/songs/new'
    end

    get '/songs/:slug' do
      @song = Song.find_by_slug(params[:slug])
      erb :'/songs/show'
    end

    post '/songs' do
      puts params
      @song = Song.create(name:params["name"])
      #if !params["artist"].nil?
      @song.artist = Artist.create(name:params["artist"])
      #end
      @song.save
      redirect "/songs#{@song.slug}"
    end



    get '/songs/:id' do
      @song = Song.find(params[:id])
      erb :'/songs/show'
    end




end
