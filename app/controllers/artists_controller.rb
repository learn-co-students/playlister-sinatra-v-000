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
  
  get '/artists/:slug' do
    @artists = Artist.find_by_slug
    erb :'artists/show'
  end
  
  
  
  
  
  
end
