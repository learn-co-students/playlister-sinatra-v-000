require 'pry'

class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all 
    erb :'/songs/index' 
  end

  get '/songs/:slug' do
  
    @song = Song.find_by_slug(params[:slug])

    erb :'/songs/show'
  end


end



  # # get '/owners' do
  # #   @owners = Owner.all
  # #   erb :'/owners/index' 
  # # end

  # # get '/owners/new' do 

  # #   erb :'/owners/new'
  # # end

  #  get '/pets' do
  #   @pets = Pet.all
  #   erb :'/pets/index' 
  # end
