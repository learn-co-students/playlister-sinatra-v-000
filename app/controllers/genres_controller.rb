require "rack-flash"
class GenresController < ApplicationController
  use Rack::Flash

  configure do
    enable :sessions
  end
  
  get '/genres' do
    @genres = Genre.all
    erb :'genres/index'
  end




end