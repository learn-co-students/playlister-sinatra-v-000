class GenresController < ApplicationController
  get('/genres') {
    @genres = Genre.all
    erb :'genres/index'
}

  get('/genres/:slug') {
    @genre = Genre.find_by_slug(params[:slug])
    erb :'/genres/show'
  }
end