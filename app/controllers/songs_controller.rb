require 'pry'

class SongsController < ApplicationController

    get '/songs' do
      @songs = Song.all
      erb :'songs/index'
    end


    get '/songs/new' do
    erb :'songs/new' #show new songs view
    end
    
    
    get '/songs/:slug' do
      @song = Song.find_by_slug(params[:slug])
      erb :'songs/show'
    end


    post '/songs' do
    @song = Song.create(params[:song])
    flash[:message] = "Successfully created song."
    redirect to("/songs/#{@song.slug}")
    end


    get '/songs/:id' do
      @song = Song.find(params[:id]) #define instance variable for view
      erb :'songs/show' #show single Song view
    end



    get '/songs/:id/edit' do
      @song = Song.find(params[:id])
      erb 'songs/edit'
    end


    patch '/songs/:id' do
    # @song = Song.find(params[:id])
    # @song.assign_attributes(params[:Song])
    # redirect "/songs/#{@song.id}"
    # flash[:message] = "Successfully created song."
    redirect to("/songs/#{@song.slug}")
    end


    patch '/songs/:slug' do
    end 
end
