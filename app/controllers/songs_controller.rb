class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :index
  end

  get 'songs/edit' do
    erb :edit
  end

end
