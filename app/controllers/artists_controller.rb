require 'pry'
class ArtistsController < Sinatra::Base

  get '/artists' do
    #binding.pry
    erb :'/artists/index'
  end

  get '/artists/:slug' do
    #binding.pry
  end
end
