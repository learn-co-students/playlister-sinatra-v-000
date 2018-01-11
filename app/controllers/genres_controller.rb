class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb :"genres/index"
  end

  get '/genres/new' do
    erb :"genres/new"
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :"genres/show"
  end

  post '/genres' do
    @genre = Genre.create(params)
    redirect "/genres/#{@genre.slug}"
  end

end
