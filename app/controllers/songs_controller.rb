class SongsController < ApplicationController

  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  post '/songs' do
    @song = Song.create(params[:song])
    params[:genres].each do |genre|
      @song.genres << Genre.find_by(genre[:id])
    end

    if !params["artist"]["name"].empty? && !Artist.find_by(:name => params["artist"]["name"])
      @song.artist = Artist.create(name: params["artist"]["name"])
    elsif Artist.find_by(:name => params["artist"]["name"])
      @song.artist = Artist.find_by(:name => params["artist"]["name"])
    end

    @song.save

    flash[:message] = "Successfully created song."
    redirect to("/songs/#{@song.slug}")
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params["song"])


    if !params["artist"]["name"].empty? && !Artist.find_by(:name => params["artist"]["name"])
      @song.artist = Artist.create(name: params["artist"]["name"])
    elsif Artist.find_by(:name => params["artist"]["name"])
      @song.artist = Artist.find_by(:name => params["artist"]["name"])
    end

    @song.save

    flash[:message] = "Successfully updated song."
    redirect to("/songs/#{@song.slug}")

  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/show"
  end


end
