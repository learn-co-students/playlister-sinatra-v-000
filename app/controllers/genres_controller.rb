class GenresController < ApplicationController
  get '/genres' do
    @genres = Genre.all.sort
    erb :'/genres/index'
  end

  get '/genres/#{genre.slug}' do
    erb :'/genres/show'
  end

end
