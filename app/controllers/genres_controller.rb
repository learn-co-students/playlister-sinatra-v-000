class GenresController < ApplicationController

  get '/genres' do
    @title = 'Playlister - Genres'
    @genres = Genre.all
    erb :'/genres/index'
  end

  get '/genres/:slug' do
    @title = '<%= @genre.name.capitalize %>'
    @genre = Genre.find_by_slug(params[:slug])
    erb :'genres/show'
  end
end
