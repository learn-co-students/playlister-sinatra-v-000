require "rack-flash"
  class ArtistsController < ApplicationController
    use Rack::Flash
  
  get '/artists' do
    @artists = Artists.all
    erb :'artists/index'
  end
  
  
  
  
  
  
  
end
