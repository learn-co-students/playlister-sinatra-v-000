class SongsController < ApplicationController

get '/songs/new' do
  @songs = Songs.all

  erb :'/songs/index'
end







end
