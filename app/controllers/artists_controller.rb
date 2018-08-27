class ArtistsController < ApplicationController
  get '/artists' do
    erb :'/artists/index'
  end
end
