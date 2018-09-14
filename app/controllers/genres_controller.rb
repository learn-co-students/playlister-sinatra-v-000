class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    # binding.pry
    erb:'/genres/index'
  end
end
