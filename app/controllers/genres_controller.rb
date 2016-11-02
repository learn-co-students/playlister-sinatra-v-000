class GenresController < ApplicationController

  get '/genres' do
    #presents user list of all songs in lib.
    #each song should be clickable link
    @genres = Genre.all
    erb :'/genres/index'
  end
end
