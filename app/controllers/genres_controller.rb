class Genrescontroller < ApplicationController


  get '/genres/index' do
    erb :'genres/index'
  end

  get '/genres/show' do
    erb :'genres/show'
  end

end
