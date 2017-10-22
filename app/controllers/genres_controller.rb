class GenresController < ApplicationController

  get '/genres' do
    @genress = Genre.all
    erb :'/genres/show'
  end
 


end
