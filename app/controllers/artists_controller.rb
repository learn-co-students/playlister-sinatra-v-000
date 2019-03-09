require "rack-flash"
  class ArtistsController < ApplicationController
    use Rack::Flash
  
  configure do
    enable :sessions
  end
  
  get '/artists' do
    @artists = Artist.all
    erb :'artists/index'
  end
  
  # get '/artist/'
  
  
  
  
  
  
end
