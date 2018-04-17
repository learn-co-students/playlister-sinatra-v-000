class GenresController < ApplicationController
  get '/genres' do
    erb :'genres/index'
  end

  get '/genres/:slug' do
    @genre=Genre.find_by_slug(params[:slug])
    erb :'genres/show'
  end

  get '/genres/new' do
    "Hello World"
  end
end
