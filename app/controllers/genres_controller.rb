class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb :"genres/show"
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :genre
  end

end