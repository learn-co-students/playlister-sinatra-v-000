class GenreController < ApplicationController

  get '/genres' do
    erb :'genres/genrelist'
  end


end
