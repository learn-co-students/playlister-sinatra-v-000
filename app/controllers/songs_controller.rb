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
    redirect "/songs/#{@song.slug}"
  end


  # post '/owners' do
  #   @owner = Owner.create(params["owner"])
  #   if !params["pet"]["name"].empty?
  #     @owner.pets.build(name: params["pet"]["name"])
  #   end
  #   @owner.save
  #   redirect "owners/#{@owner.id}"
  # end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

end
