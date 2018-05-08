require 'rack-flash'
class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all

    erb :'/songs/index'
  end

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(params["song"])
    params["genres"].each do |gid|
      @song.genres << Genre.find(gid.to_i)
    end
    @song.artist = Artist.find_or_create_by(params["artist"]) unless params["artist"]["name"].empty?
    @song.genres.build(params["genre"]) unless params["genre"]["name"].empty?
    if @song.save
      flash[:message] = "Successfully created song."
    end

    redirect :"/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params["slug"])

    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params["slug"])
    @artists = Artist.all
    @genres = Genre.all

    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params["slug"])

    @song.genres.clear
    params["genres"].each do |gid|
      @song.genres << Genre.find(gid.to_i)
    end
    @song.artist = Artist.find_or_create_by(params["artist"]) unless params["artist"]["name"].empty?
    @song.genres.build(params["genre"]) unless params["genre"]["name"].empty?

    if @song.save
      flash[:message] = "Successfully updated song."
    end

    redirect :"/songs/#{@song.slug}"
  end

end
