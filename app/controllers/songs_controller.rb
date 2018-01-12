
class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
  @song = Song.find_by_slug(params[:slug])
  erb :'/songs/show'
end

post '/songs' do
  @song = Song.create(:name => params["Name"])
  if !params["song"]["artist_name"].empty?
  @song.artists << Artist.find_or_create_by(:name => params["Artist Name"])
end
  @song.genre_ids = params[:genres]
  @song_genres = song.genres
  @song.save
  flash[:message] = "Successfully created song."
redirect to("/songs/#{@song.slug}")
end

get 'songs/:slug/edit' do
    @songs = Song.find(params[:id])
    erb :'/songs/edit'
  end

  get '/songs/:id' do
    @song = Song.find(params[:id])
    erb :'/songs/show'
  end

  post '/songs/:id' do
    @song = Song.find(params[:id])
    @song.update(params["song"])
    if !params["song"]["name"].empty?
      @song.artists << Pet.create(name: params["pet"]["name"])
    end
    redirect to "owners/#{@owner.id}"
end
end
