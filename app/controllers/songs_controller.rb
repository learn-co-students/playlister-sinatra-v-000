class SongsController < ApplicationController

  get '/songs' do
    erb :show
  end

end