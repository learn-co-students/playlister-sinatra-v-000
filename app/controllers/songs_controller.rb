class SongsController < ApplicationController

get '/songs' do
  @songs = Songs.all

  erb :'/songs/index'
end







end
