require 'sinatra/base'
require 'rack-flash'


class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do 
    @songs = Song.all

    erb :'/songs/index'
  end

  get '/songs/new' do 
   # binding.pry

    erb :'/songs/new'
  end

  get '/songs/:slug' do
    
    @song = Song.find_by_slug(params[:slug])
    #binding.pry
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do 
    @song = Song.find_by_slug(params[:slug])

    erb :'/songs/edit'
  end


  post '/songs/new' do 
    @new_song = Song.create(:name => params["Name"])
    
    @new_song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @new_song.genre_ids = params[:genres]  

    # @new_song = Song.create(:name => params[:song][:name])#, :genre => params[:genres])
    # #if params[:name], get redirect errors - goes 
    # #to songs/new instead of slug

    # #if params[:song][:name], get create new song 
    # #error / genre not displayed on page
    # #binding.pry
    # @artist = Artist.find_or_create_by(:name => params[:artist][:name])
    # @artist.songs << @new_song
    #@new_song.genres << params[:genres]  
    #this one also switches on/off: << vs =
    @new_song.save

    flash[:message] = "Successfully created song."
    redirect to("/songs/#{@new_song.slug}")

  end


  post '/songs/:slug/edit' do
   binding.pry

    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    if !params["song"]["genre"].empty?
      @song.genre = Genre.create(name: params["song"]["genre"])
    end
    redirect to :'/songs/:slug'



    # @pet = Pet.find(params[:id])
    # @pet.update(params[:pet])
    # if !params["owner"]["name"].empty?
    #   @pet.owner = Owner.create(name: params["owner"]["name"])
    # end
    # @pet.save

    # redirect to "pets/#{@pet.id}"

  end


end


