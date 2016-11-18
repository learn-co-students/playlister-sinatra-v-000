require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs' do
    # params[:artist] = {name: ""}
    # params[:song] = {name: "", artist_id: "", genre_ids: []}
    @song = Song.create(params[:song])
    @song.artist = Artist.find_or_create_by(params[:artist]) unless params[:artist][:name].empty?
    @song.save
    flash[:message] = "Successfully created song."
    redirect("/songs/#{@song.slug}")
  end

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @artists = Artist.all
    @genres = Genre.all
    erb :'/songs/edit'
  end

  post '/songs/:slug' do
    # => {"song"=>{"name"=>"Video Games", "artist_id"=>"94", "genre_ids"=>["3", "4"]}, "artist"=>{"name"=>""} ...
    song = Song.find_by_slug(params[:slug])
    song.update(params[:song])
    song.artist = Artist.find_or_create_by(name: params[:artist][:name]) unless params[:artist][:name].empty?
    song.save
    flash[:message] = "Successfully updated song."
    redirect("/songs/#{song.slug}")
  end
end
