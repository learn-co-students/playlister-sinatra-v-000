class GenresController < ApplicationController
<<<<<<< HEAD

  get '/genres' do
    @genres = Genre.all

    erb :"/genres/index"
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :"/genres/show"
  end

=======
  # include Slugifiable

  get '/genres' do
    @genres = Genre.all
    erb :"/genres/index"
  end

  get '/genres/new' do
    erb :"/genres/new"
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])

    erb :"genres/show"
  end
>>>>>>> 1f9fad4566e7bea66933d1080285aea037651e86
end
