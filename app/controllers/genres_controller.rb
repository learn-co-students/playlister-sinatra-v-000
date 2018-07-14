class GenresController < ApplicationController

  get '/genres' do
    @self = Genre
    erb :index
  end

  get '/genres/:slug' do
    @instance = Genre.find_by_slug(params["slug"])
    erb :show
  end
end
