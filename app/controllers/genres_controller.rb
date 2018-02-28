class GenresController < ApplicationController

  get '/genres' do
    @genres = Genres.all
    erb :'genres/genres'
  end
  get '/genres/new' do
    erb :'genres/new_genre'
  end
  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :'genres/genre'
  end

end
