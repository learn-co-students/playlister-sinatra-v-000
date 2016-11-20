class GenreController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb :'/genres/index' # displays a list of genres
  end

  # Redirects to the genre's page
  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])

    erb :'genres/show' # displays information about a genre
  end

end