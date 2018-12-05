class GenresController < ApplicationController
  get '/genres' do
<<<<<<< HEAD
  	@genres = Genre.all.sort_by {|genre| genre.name}
=======
    @genres = Genre.all
>>>>>>> e415e7cd986e05b5834fbcc02fa42d725277e25e
    erb :'/genres/index'
  end

  get '/genres/:slug' do
      # binding.pry
    @genre = Genre.find_by_slug(params[:slug])
    erb :'/genres/show'
  end
end
