class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb :'genres/index'
  end

  get '/genres/:slug' do
    genre = Genre.find_by_slug(params[:slug])
    @genre_name = genre.name.capitalize
    @songs = genre.songs
    erb :'genres/show'
  end

end
