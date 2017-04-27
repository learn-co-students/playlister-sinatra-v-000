class GenresController < ApplicationController
  get '/genres' do
    @genres = Genres.all
    erb :'/genres/index'
  end

  get '/genres/:slug' do

  end

end
