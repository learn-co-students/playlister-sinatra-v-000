class SongsController < ApplicationController

get '/songs' do
  @songs = Song.all
  erb :'/songs/index'
end

get '/songs/new' do

  erb :'/songs/new'
end

get '/songs/:slug' do
  @song = Song.all.find_by_slug(params[:slug])
  @artist = Artist.find_by(name: @song.artist.name)
  erb :'/songs/show'
end

post '/songs' do
  
end

end
