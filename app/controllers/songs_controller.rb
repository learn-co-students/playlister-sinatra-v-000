require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash, :sweep => true

  get '/songs' do
    @songs = Song.all.sort_by{|song| song.name}
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all.sort_by{|g| g.name}
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    session[:message] = nil
    erb :'songs/show'
  end

  post '/songs' do
    @song = Song.new(params[:song]) unless @song
    artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.artist = artist


    if params["genres"]
      genre = Genre.find(params[:genres])
      @song.genres << genre unless @song.genres.include?(genre)
    end

    if !params["genre"]["name"].empty?
      @song.genres << Genre.create(name: params["genre"]["name"])
    end

    @song.save

    flash[:message] = "Successfully created song."

    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'songs/edit'
  end

  post '/songs/:slug' do

    @song = Song.find_by_slug(params[:slug])

    if !params[:song][:name].empty? && params[:song][:name]!= @song.name
      @song.update(name: params[:song][:name])
    end

    if !params[:artist][:name].empty? && params[:artist][:name] != @song.artist.name
      artist = Artist.find_or_create_by(name: params[:artist][:name])
      @song.artist = artist
    end

    if params["genres"]
      genre_array = Genre.find(params[:genres])
      @song.genres.replace(genre_array)
    end

    if !params["genre"]["name"].empty?
      @song.genres << Genre.create(name: params["genre"]["name"])
    end

    @song.save
    flash[:message] = "Successfully updated song."

    redirect to "/songs/#{@song.slug}"
  end



end
