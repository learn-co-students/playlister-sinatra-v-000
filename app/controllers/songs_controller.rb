require 'rack-flash'
class SongsController < ApplicationController
  use Rack::Flash
  get '/songs' do
    @song_list = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(:name => params["Name"])

    if !params["Artist Name"].empty?
      @new_artist = Artist.find_or_create_by(:name => params["Artist Name"])
      @song.artist = @new_artist
    end
      #binding.pry
    @song.genre_ids = params["genres"]
    @song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @sluggish = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  get '/songs/:slug' do
    @sluggish = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs/:slug' do
    #binding.pry
    @song = Song.find_by_slug(params[:slug])
    #if !params["Artist Name"].empty?
      @artist = Artist.find_or_create_by(:name => params["Artist Name"])
      @song.artist = @artist
    #end
    @song.genre_ids = params["genres"]
    @song.save
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end
end
