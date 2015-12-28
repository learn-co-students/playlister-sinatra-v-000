class GenreController < ApplicationController

  get '/genres' do
    @genres = Genre.all.sort_by(&:name)
    erb :'/genres/index'
  end
end
