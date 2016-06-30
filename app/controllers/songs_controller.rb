class SongsController < ApplicationController

  get '/songs' do
    erb :'songs/show'
  end
end
