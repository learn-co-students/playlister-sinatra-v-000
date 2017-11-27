require 'pry'

class GenresController < ApplicationController

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :'genres/show'
  end

  get '/genres' do
    erb :'genres/index'
  end
end
