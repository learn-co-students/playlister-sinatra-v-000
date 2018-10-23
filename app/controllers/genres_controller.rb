class GenresController < ApplicationController

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])

  end

  get '/genres' do
    @genres = Genre.all

    erb :'/genres/index'
  end

  get '/genres/:id' do
    @genre = Genre.find_by_id(params[:id])
  end
end
