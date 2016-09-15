require 'pry'

class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb :'/genres/index' 
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :'/genres/show'
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
