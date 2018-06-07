class GenresController < ApplicationController

  get '/genres' do
    @genres = Song.all
    erb :'genres/index'
  end

end
