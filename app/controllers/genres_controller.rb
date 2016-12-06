class GenresController < ApplicationController

  get '/genres' do
    # list of all genres
    # each w/ clickable link
    # "Classical"
    @genres = Genre.all
    erb :'/genres/index'
  end
end
