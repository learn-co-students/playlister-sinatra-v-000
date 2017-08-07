class GenresController < ApplicationController
  get '/genres' do
    erb :'/genres/index'
  end

  post '/genres' do

  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :'/genres/show'
  end
end
