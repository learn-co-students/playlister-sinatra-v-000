class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb :index
  end

end
