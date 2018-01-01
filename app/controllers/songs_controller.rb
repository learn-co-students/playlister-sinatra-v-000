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
    @song = Song.create(name: params["song"]["name"])
    @song.artist = Artist.find_or_create_by(name: params["song"]["artist"])
    if !params["genres"].empty?
      params["genres"].each do |genre|
        @song.genres << Genre.find_or_create_by(id: genre)
      end
    end
    @song.save
    flash[:message] = "Successfully created song."
    redirect to "songs/#{@song.slug}"
  end

  get '/songs/:slug' do
      @song = Song.find_by_slug(params[:slug])
      erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
      @song = Song.find_by_slug(params[:slug])
      erb :'/songs/edit'
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(name: params["song"]["name"])
    @song.artist = Artist.find_or_create_by(name: params["song"]["artist"])
    if !params["genres"].empty?
      @song.genres = params["genres"].collect do |genre|
        Genre.find_or_create_by(id: genre)
      end
    end
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to "songs/#{@song.slug}"
  end

end
