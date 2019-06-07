require 'sinatra/base'
require 'rack-flash'

class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do

    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
    @artist = Artist.find_or_create_by(name: params["song"]["artist"])
    @song = Song.create(name: params["song"]["name"])
    @song.artist = @artist
      if params["genres"] != nil
        params["genres"].each do |genre_id|
          if Genre.find(genre_id)
            @song.genres << Genre.find(genre_id)
          else
            @genre = Genre.create(name: params["genre"])
            @song.genres << @genre
          end
        end
      else
        @genre = Genre.create(name: params["genre"][0])
        @genre.save
      end
    @song.save
    slug = @song.slug
    flash[:message] = "Successfully created song."
    redirect to  :"songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs/:slug/edit' do
    @genres = Genre.all
    @song = Song.find_by_slug(params[:slug])

    erb :'songs/edit'
  end

  patch "/songs/:slug" do
    #binding.pry
    @song = Song.find_by_slug(params[:slug])
    @song.update(name: params["song"]["name"])
      if params["song"]["artist"] != nil || params["song"]["artist"] != ""
        @song.artist.name = params["song"]["artist"]
      end
    @song.genres.clear
      if params["genres"] != nil
        params["genres"].each do |genre_id|
          if Genre.find(genre_id)
            @song.genres << Genre.find(genre_id)
          else
            @genre = Genre.create(name: params["genre"])
            @song.genres << @genre
          end
        end
      else
        @genre = Genre.create(name: params["genre"][0])
        @genre.save
      end

  flash[:message] = "Successfully edited song."
  redirect to "songs/#{@song.slug}"
  end

end
