class ArtistsController < ApplicationController

  get '/' do
    erb :index
  end

  get '/artists' do
    erb :'artists/index'
  end
end
