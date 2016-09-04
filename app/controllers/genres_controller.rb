require 'pry'
class GenresController < ApplicationController

# genres route controller
  get '/genres' do
    @genres = Genre.all
    erb :'genres/index'
  end

  get '/genres/show' do
    erb :'genres/show'
  end

  get'/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    @artist = Artist.find_by_slug(params[:slug])

    erb :'genres/show'
  end

end
