class GenresController < ApplicationController

  get '/genres' do
    erb :'/genres/index'
  end

  get '/genres/:id' do
    erb :'/genres/:id/show'
  end


end
