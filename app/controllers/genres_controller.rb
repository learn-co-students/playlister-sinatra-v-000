class GenresController < ApplicationController

  get '/genres' do
    erb :'genres/index'
  end

end
