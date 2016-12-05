require 'pry'
class ArtistsController < ApplicationController

  get '/artists' do
    erb :'/artists/index'
  end

  get '/artists/:slug' do
    erb :'/genres/show'
  end
end
