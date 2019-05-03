class SongController < ApplicationController

  get '/songs' do
    erb :index
  end
end