class SongsController < ApplicationController

  get '/songs' do
    erb :songs
  end
end
