class ArtistsController < ApplicationController

  get '/artists' do
    erb :'/artists/index'
  end

  get '/artists/:id' do
    erb :'/artists/:id/show'
  end


end
