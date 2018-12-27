class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb :'/genre/index'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    #binding.pry
    erb :'/genre/show'
  end
end
