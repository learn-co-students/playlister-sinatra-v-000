class GenresController < ApplicationController
  get '/genres' do
    @genres = Genres.all
  end

end
