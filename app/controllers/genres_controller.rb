class GenresController < ApplicationController
  get '/genres' do
    @genres = Genre.all
    erb :'genres/index'
  end

  get '/genres/:slug' do
    slug = params[:slug]
    @genre = Genre.all.detect { |genre| genre.slug == slug}
    erb :'genres/show'
  end
end
