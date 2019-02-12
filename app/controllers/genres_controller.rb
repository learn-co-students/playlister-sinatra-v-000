class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb :'/genres/index'
  end

  get '/genres/new' do

  end

  post '/genres' do

  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :'/genres/show'
  end

  get '/genres/:slug/edit' do

  end

  patch '/genres/:slug' do

  end
end
