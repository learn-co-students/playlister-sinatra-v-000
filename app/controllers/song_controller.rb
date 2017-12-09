require 'sinatra/base'
require 'rack-flash'

class SongController < ApplicationController

  enable :sessions
  register Sinatra::Flash

  get '/songs' do
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params["slug"])
    erb :'songs/show'
  end

  post '/songs' do
    @song = Song.create(params["song"])

    if params[:artist][:name] == ""
      @song.artist = Artist.find(params["artist"]["artist_id"])
      @song.save
    else
      @song.artist = Artist.find_or_create_by(params["artist"])
      @song.save
    end

    if params["genre"]["name"] == ""
      params["genres"].each_with_index do |g, i|
        @song.genres << Genre.find(params["genres"][i])
        @song.save
      end
    end

    if params["genre"]["name"] != ""
      @song.genres << Genre.create(params["genre"])
      @song.save
    end

    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params["slug"])
    @genres = Genre.all
    erb :'/songs/edit'
  end

  post '/songs/:slug' do

    if !params[:artist][:name].empty?
      @song = Song.find_by_slug(params["slug"])
      @song.artist = Artist.find_or_create_by(params["artist"])
      @song.save
    end

    if params["genres"] != nil
      @song = Song.find_by_slug(params["slug"])

      params["genres"].each_with_index do |g, i|
        @song.genres << Genre.find(params["genres"][i])
        @song.save
      end
    end

    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end


end
