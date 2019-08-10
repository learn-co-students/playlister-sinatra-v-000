class SongsController < ApplicationController
  
  get '/songs' do
    erb :"songs/index"
    # This helped with the syntax above: https://stackoverflow.com/questions/2129504/sinatra-sub-directory-views
  end
  
end
