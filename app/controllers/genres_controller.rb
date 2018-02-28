class GenresController < ApplicationController

  # ----- INDEX -----

  get '/genres' do
    erb :'/genres/index'
  end

  # ----- READ -----

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :'/genres/show'
  end

end
