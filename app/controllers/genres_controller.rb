class GenresController < ApplicationController

  get '/genres' do
    @title = 'Playlister - Genres'
    @genres = Genre.all
    erb :'/genres/index'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    @title =  "#{@genre.name.capitalize}"
    erb :'genres/show'
  end
end
