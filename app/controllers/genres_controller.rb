class GenresController < ApplicationController

  get '/' do
    erb :index
  end

  get '/genres' do
    @genres = Genre.all
    erb :'genres/index'
  end

  get '/genres/:slug' do
    #need to turn the slug into an id
    @genre = Genre.find_by_slug(params[:slug])
    erb :'/genres/show'
  end
end
