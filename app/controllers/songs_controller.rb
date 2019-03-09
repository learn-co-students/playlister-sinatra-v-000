require "rack-flash"
  class SongsController < ApplicationController
  use Rack::Flash

  configure do
    enable :sessions
  end
  
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  


end