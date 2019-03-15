class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
  end

  # get '/genres/:slug' do
  # end
end
