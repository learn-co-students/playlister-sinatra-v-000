class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb :'genres/index'
  end

  post '/genres' do
    @genre = Genre.create(name: params["genre"]["name"])
    @genre.save
    slug = @genre.slug
    redirect to :"genres/#{@genre.slug}"
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :'genres/show'
  end
end
