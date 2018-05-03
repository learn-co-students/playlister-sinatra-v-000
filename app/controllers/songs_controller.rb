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
      if !params["artist"].nil?
      @song = Song.create(name:params["name"])
      @song.artist = Artist.find_or_create_by(:name => params["artist"])
      @song.genre_ids = params[:genres]
      end
      binding.pry
      @song.save
      flash[:message] = "Successfully created song."
binding.pry
      redirect to("/songs/#{@song.slug}")
      binding.pry
  end


    get '/songs/:id' do
      @song = Song.find(params[:id])
      erb :'/songs/show'
    end




end
