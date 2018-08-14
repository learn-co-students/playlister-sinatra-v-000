
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
      artist = Artist.find_by(name: params[:artist_name])
      artist ||= Artist.find_by(name: params["artist"]["name"])
      @song.artist = artist
    end

    if !params["genre"]["name"].empty? && !Genre.find_by(name: params["genre"]["name"])
      @song.genres.build(name: params["genre"]["name"])
    else
      genre = Genre.find_by(name: params[:genre_name])
      genre ||= Genre.find_by(name: params["genre"]["name"])
      # binding.pry
      @song.genres << genre
    end


    @song.save
    @message = "Successfully created song."
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
    else
      artist = Artist.find_by(name: params[:artist_name])
      artist ||= Artist.find_by(name: params["artist"]["name"])
      @song.artist = artist
    end

    if !params["genre"]["name"].empty? && !Genre.find_by(name: params["genre"]["name"])
      @song.genres.build(name: params["genre"]["name"])
    else
      genre = Genre.find_by(name: params[:genre_name])
      genre ||= Genre.find_by(name: params["genre"]["name"])
      # binding.pry
      @song.genres << genre
    end


    @song.save
    @message = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end
end
