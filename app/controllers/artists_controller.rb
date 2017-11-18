class Artistscontroller < ApplicationController

  get '/artists/index' do
    erb :'artists/index'
  end

  get '/artists/show' do
    erb :'artists/show'
  end

end
