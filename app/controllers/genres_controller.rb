require 'pry'
class GenresController < ApplicationController

# genres route controller
  get '/genres' do
    @genres = Genre.all
    erb :'genres/index'
  end

  get '/genres/show' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :'genres/show'
  end

end
