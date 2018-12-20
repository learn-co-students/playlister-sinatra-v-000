class SongsController < ApplicationController
  get '/songs' do
    @owners = Owner.all
    erb :'/owners/index' 
  end
end
