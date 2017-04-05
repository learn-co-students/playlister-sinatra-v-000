class GenresController < ApplicationController

  get '/genres' do
    erb :index
  end

  get '/genres/:slug' do
    erb :index
  end
end
