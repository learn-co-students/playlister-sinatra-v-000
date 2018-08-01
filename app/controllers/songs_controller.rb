class SongsController < ApplicationController

get '/songs' do
  @songs = Song.all
  erb :'/songs/index'
end

get '/songs/new' do
    erb :'/songs/new'
  end

get '/songs/:slug' do
  @song = Song.find_by_slug(params[:slug])
  erb:'/songs/show'
end

get '/songs/:id/edit' do
    @song = Song.find_by_id(params[:id])
    erb :edit
  end

patch '/songs/:id' do
  @song = Song.find_by_id(params[:id])
  @song.name = params[:name]
  @song.artist = params[:artist]
  @song.genres = params[:genres]
  @song.save
  redirect to "/song/#{@song.id}"
end

end
