require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    @artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song = Song.create(name: params["Name"], artist: @artist)
    @song.genre_ids = params[:genres]
    # params[:genres].each do |genre_id|
    #   @song.genres << Genre.find(genre_id)
    @song.save
    # end
    flash[:message] = "Successfully created song."

    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])

    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    artist = Artist.find_or_create_by(name: params[:song][:artist])
    @song.update(name: params[:song][:name], artist: artist)
    @song.genre_ids = params[:genre_ids]
    @song.save
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end

  delete '/songs/:slug/delete' do
    @song = Song.find_by_slug(params[:slug])
    @song.destroy
    erb :'/songs/delete'
  end

end
