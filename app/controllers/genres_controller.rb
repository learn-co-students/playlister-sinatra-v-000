class GenreController < ApplicationController
  
  get '/' do
    erb :'genres/index'
  end
  
  
end
