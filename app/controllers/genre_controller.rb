class GenreController < ApplicationController

  get '/genres' do
    erb :'/genres/genre_index'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :'/genres/genre_show'
  end

end
