require 'rack-flash'
class SongsController < ApplicationController
enable :sessions
use Rack::Flash

  get '/songs' do
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @songs_id = Song.find_by_slug(params[:slug])

    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  post '/songs' do
    @new_song = Song.create(:name => params["Name"])
    @new_song.artist = Artist.find_or_create_by(:name => params["Artist Name"])

    @new_song.genres << Genre.find_by(:id => params[:genres])
    @new_song.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@new_song.slug}"
  end

  patch '/songs/:slug' do
    @edit_song = Song.find_by_slug(params[:slug])
    @edit_song.update(:name => params["Name"])
    @edit_song.artist = Artist.find_or_create_by(:name => params["Artist Name"])

    @edit_song.save
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@edit_song.slug}"
  end


end
