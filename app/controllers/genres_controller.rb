class GenresController < ApplicationController

  post '/genres' do
    Genre.create(name: params[:name])

    erb :'/genres/index'
  end

  get '/genres' do
    @genres = Genre.all

    erb :'/genres/index'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])

    erb :'/genres/show'
  end
end
