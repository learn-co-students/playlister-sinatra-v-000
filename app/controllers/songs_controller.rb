require 'rack-flash'
class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/song/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
  @song = Song.find_by_slug(params[:slug])
  erb :'/songs/show'
end

post '/songs' do
  @song = Song.create(name: params["song_name"])
  @song.artist = Artist.find_or_create_by(name: params["Artist name"])
  @song.song_genres(name: params["genres"])
  @song.save
  flash[:message] = "Successfully created song."
redirect to "/songs/#{@song.slug}"
end

get 'songs/:slug/edit' do
    @songs = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:name])
    @song.artists = Artist.find_or_create(name: params[:artist][:name])
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to "songs/#{@song.slug}"

end
end
