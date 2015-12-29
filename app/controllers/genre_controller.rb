class GenreController < ApplicationController

  get '/genres' do
    @genres = Genre.all.sort_by(&:name)
    erb :'/genres/index'
  end

  get '/genres/:slug' do
    @genre = Genre.all.find_by_slug(params[:slug])
    erb :'/genres/show'
  end
end
