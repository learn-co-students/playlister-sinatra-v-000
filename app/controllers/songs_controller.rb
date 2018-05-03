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
    #  binding.pry
      @song = Song.create(name:params[:name])
      @song.artist = Artist.find_or_create_by(:name => params["artist"])
      @song.save
#binding.pry
      @song.genre_ids = params[:genres]

      flash[:message] = "Successfully created song."

#binding.pry
      redirect to("/songs/#{@song.slug}")
    end
# use in console to delete empty songs -> Artist.all.select{|artist| artist unless artist.name}.each do |artist| artist.destroy end

    patch '/songs/:slug/edit' do

      erb :'/songs/edit'
    end

    get '/songs/:id' do
      @song = Song.find(params[:id])
      erb :'/songs/show'
    end




end
