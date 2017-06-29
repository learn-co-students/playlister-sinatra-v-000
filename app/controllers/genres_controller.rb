class GenresController < ApplicationController

  get '/genres' do
    @genres= Genre.all
    erb :'/genres/index'
  end

  post '/genres' do
    erb :'genres/index'
  end
end
