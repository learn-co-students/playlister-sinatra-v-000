class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb :'/genres/genre'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :"/genres/show"
  end
end
