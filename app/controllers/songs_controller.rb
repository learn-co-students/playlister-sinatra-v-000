class SongsController < ApplicationController
  get '/songs' do
    erb :'songs/index'
  end
  get '/songs/:name' do
    @song = Song.find_by(name: params[:name])
    erb :'songs/show'
  end
end
