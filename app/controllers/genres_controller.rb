class GenresController < ApplicationController

  get '/' do
    erb :index
  end

  get '/genres' do
    erb :'genres/index'
  end

  get '/genres/:id' do
    @genre = Genre.find_by_id(params[:id])
    erb :'genres/show'
  end
end
