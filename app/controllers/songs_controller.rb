class SongsController < ApplicationController

  get '/songs' do
    erb :"/songs/index"
  end
end
