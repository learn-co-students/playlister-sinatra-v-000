class GenreController < ApplicationController

  get '/genres' do
      @genres = Genre.all
      erb :'genres/index'
  end

 end
