require 'pry'
class ArtistsController < ApplicationController

  get '/artists' do
    binding.pry
    erb :index
  end

  get '/artists/:slug' do
    erb :index
  end

end
