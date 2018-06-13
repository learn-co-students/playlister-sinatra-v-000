require 'sinatra/base'
require 'rack-flash'

class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(name: params[:song_name])
    genres = Genre.find(params[:genres])
    genres.each {|genre| @song.genres << genre}
    #if Artist.all.include?(params)
    if !params[:artist_name].empty? && params[:artist_id]
      redirect to '/songs/new'
    elsif !params[:artist_name].empty? && !Artist.all.detect {|artist| artist.name == params[:artist_name]}
      @song.artist_id = Artist.create(name: params[:artist_name]).id
    else
      @song.artist_id = params[:artist_id]
    end
    @song.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
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
    genres = Genre.find(params[:genres])
    genres.each {|genre| @song.genres << genre if !@song.genres.include?(genre)}
    @song.name = params[:song_name]
    if params[:artist_id] != nil
      @song.artist_id = params[:artist_id]
    elsif params[:artist_name] != ""
      @song.artist_id = Artist.create(name: params[:artist_name]).id
    end
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end

end
