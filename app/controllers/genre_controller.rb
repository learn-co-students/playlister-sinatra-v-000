class GenreController < ApplicationController

  get '/genres' do
    @genres = Genre.all

    erb :'/genre/index'
  end

  get '/genres/:slug' do
    @genres = Genre.find_by_slug(params[:slug])

    erb :'/genre/show'
  end

end
