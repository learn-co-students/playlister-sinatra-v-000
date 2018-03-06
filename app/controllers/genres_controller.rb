class GenresController < ApplicationController

  get '/' do
    erb :index
  end

  get '/genres' do
    erb :'genres/index'
  end
end
