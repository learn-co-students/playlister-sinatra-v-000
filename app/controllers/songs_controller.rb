class SongController < ApplicationController

  get '/songs' do
    erb :songs
  end
end
