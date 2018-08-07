class GenresController < ApplicationController


  get '/genres' do
    @genres = Genre.all
    erb :genres
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :show_genre
  end

end
