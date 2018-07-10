class GenresController < ApplicationController
  get '/genres' do
    @genres = Genre.all
    erb :"genres/index"
  end

  get '/genres/:slug' do
    @genre = Genre.find(params[:id])
    erb :"genres/show"
  end
end
