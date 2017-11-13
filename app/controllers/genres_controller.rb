class GenresController < ApplicationController
  "genres controller"

  get '/genres' do
    #binding.pry
    erb :'/genres/index'
  end

  get '/genres/:slug' do
      @genre = Genre.all.find{ |genre| genre.slug == params["slug"]}
    erb :'/genres/show'
  end
end
