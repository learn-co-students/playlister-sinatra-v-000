class SongsController < ApplicationController

  get '/' do
    erb :index
  end

  get '/songs' do
    erb :'songs/index'
  end

  get '/songs/:id' do
    @song = Song.find_by_id(params[:id])
    erb :'songs/show'
  end
end
