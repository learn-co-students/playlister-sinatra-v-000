class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
#    "Hello World"
    erb :'/genres/index'
  end

end
