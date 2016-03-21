class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb :genres
  end

end
