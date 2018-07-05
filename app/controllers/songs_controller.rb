class SongsController < ApplicationController
  use Rack::Flash
  
  get '/songs' do
    @pets = Song.all
    erb :'/songs/index'
  end
  
end