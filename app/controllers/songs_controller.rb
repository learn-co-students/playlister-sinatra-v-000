require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:name_slug' do
    @song = Song.find_by_slug(params[:name_slug])
    erb :"songs/show"
  end

  post '/songs' do
    #binding.pry
    @song = Song.create(name: params[:Name])
    artist = Artist.all.find {|artist| artist.name == params["Artist Name"]}
    if !!artist
      @song.artist = artist
    else
      @song.artist = Artist.new(name: params["Artist Name"])
    end
    @song.genre_ids = params[:genres]
    @song.save

    flash[:message] = "Successfully created song."

    redirect("/songs/#{@song.slug}")
  end

  get '/songs/:name_slug/edit' do
    @song = Song.find_by_slug(params[:name_slug])
    erb :"songs/edit"
  end

  patch '/songs/:name_slug' do
    #binding.pry
    @song = Song.find_by_slug(params[:name_slug])
    artist = Artist.all.find {|artist| artist.name == params["Artist Name"]}
    if !! artist
      @song.artist = artist
    else
      @song.artist = Artist.new(name: params["Artist Name"])
    end
    @song.genre_ids = params[:genres] if params[:genres] != nil
    @song.save
    flash[:message] = "Successfully updated song."
    redirect("songs/#{@song.slug}")
  end

end
