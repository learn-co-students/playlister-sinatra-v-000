require 'sinatra/base'
require 'rack-flash'

class SongsController < ApplicationController

  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get "/songs/new" do
    erb :'songs/new'
  end

  post "/songs" do
    @song = Song.create(name: params[:song][:name])
    params[:genres].each do |genre_id|
      @song.genres << Genre.find(genre_id)
    end
    if !params[:artist][:name].empty?
      @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    end
    @song.save
    flash[:message] = "Successfully created song."
    redirect to("/songs/#{@song.slug}")
  end

  get "/songs/:slug" do

    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get "/songs/:slug/edit" do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    @song.genres.clear
    params[:genres].each do |genre_id|
      @song.genres << Genre.find(genre_id)
    end
    if !params[:artist][:name].empty?
      @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    end
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to("/songs/#{@song.slug}")
  end

end
