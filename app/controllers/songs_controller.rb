require 'rack-flash'
class SongsController < ApplicationController

  use Rack::Flash

  get '/songs' do

    @songs = Song.all

    erb :'/songs/index'
  end

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all

    erb :'/songs/new'
  end

  get '/songs/:slug' do

    @song = Song.find_by_slug(params[:slug])

    erb :'/songs/show'
  end

  post '/songs' do
      # binding.pry
    @song = Song.create(params[:song])
    if !params["artist"]["name"].empty?
      @song.artist = Artist.find_or_create_by(name: params["artist"]["name"])
    end
    @song.genre_ids = params[:genres]

    @song.save
    flash[:message] = "Successfully created song."


    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])

    erb :'/songs/edit'
  end

  patch '/songs/:slug' do

    @song = Song.find_by_slug(params[:slug])

    if !params[:name].empty?
      @song.name = params[:name]
    end
    if !params[:artist].empty?
      @song.artist = Artist.find_or_create_by(name: params[:artist])
    end

    if params[:genres]
      @song.genre_ids = params[:genres]
    end
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
   end


end
