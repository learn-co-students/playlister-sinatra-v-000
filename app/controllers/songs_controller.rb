
class SongsController < ApplicationController

  get '/songs' do
    @songs=Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
    @song = Song.new(name: params["song"]["name"])
    # I want to not create a new arstist if Artist.find_by(name: params["artist"]["name"]) finds something
    if !params["artist"]["name"].empty? && !Artist.find_by(name: params["artist"]["name"])
      @song.build_artist(name: params["artist"]["name"])
    else
      artist = Artist.find_by(id: params[:artist_id])
      artist ||= Artist.find_by(name: params["artist"]["name"])
      @song.artist = artist
    end

    @song.genre_ids = params[:genre]

    @song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @artists = Artist.all
    @genres = Genre.all
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    if !params["artist"]["name"].empty? && !Artist.find_by(name: params["artist"]["name"])
      @song.build_artist(name: params["artist"]["name"])
      @song.save
    else
      artist = Artist.find_by(id: params[:artist_id])
      artist ||= Artist.find_by(name: params["artist"]["name"])
      @song.update(artist: artist)
    end
    @song.genre_ids = params[:genre]

    @song.save
    #binding.pry
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end
end
