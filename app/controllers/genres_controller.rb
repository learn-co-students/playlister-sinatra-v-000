class GenresController < ApplicationController
  get '/genres' do
    @genres = Genre.all
    erb :'genres/index'
  end

  get '/genres/new' do
    erb :'genres/new'
  end

  get '/genres/:slug' do
    slug = params[:slug]
    @genre = Genre.all.detect { |genre| genre.slug == slug}
    binding.pry
    erb :'genres/show'
  end
end
