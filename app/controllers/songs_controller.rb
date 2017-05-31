require 'pry'
class SongsCollector < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
     @song = Song.create(name: params[:Name])
     @check_for_artist = Artist.find_by(name: params["Artist Name"])

     if !@check_for_artist
      @artist = Artist.create(name: params["Artist Name"])
      @song.artist = @artist
      @song.genres << Genre.find_by_id(params[:genres])
      redirect to "/songs/#{@song.slug}"
    end

  end

  get "/songs/:slug" do
     @slug_song = Song.find_by_slug(params[:slug])
     erb :'/songs/show'
  end
end
