class SongsController < ApplicationController

get '/songs' do
  @songs = Songs.all

  erb :'/songs/show'
end







end
