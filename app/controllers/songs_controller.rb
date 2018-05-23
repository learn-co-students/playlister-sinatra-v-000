require 'sinatra/flash'


class SongsController < ApplicationController
  enable :sessions
  register Sinatra::Flash

  get '/songs' do
    @all_song = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @all_gen = Genre.all
    @all_art = Artist.all
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(params[:song])

    if params["song_genres"]
      if !params["song_genres"]["genres_id"].empty?
        params["song_genres"]["genres_id"].each do |gen|
          @song.genres << Genre.find(gen)
        end
      end
    end

    if !params["genre"]["name"].empty?
      @song.genres << Genre.create(name: params["genre"]["name"])
    end

    if !params["artist"]["name"].empty?
      #binding.pry
      @song.artist = Artist.find_or_create_by(name: params["artist"]["name"])
    end

    @song.save

    flash[:message] = "Successfully created song."

    redirect "/songs/#{@song.slug}"
    #erb :"/songs/show"
  end

  get "/songs/:slug" do
    #binding.pry
    @song = Song.find_by_slug(params[:slug])
    if @song
      erb :'/songs/show'
    else
      redirect to "/songs"
    end
  end

  get "/songs/:slug/edit" do
    @all_gen = Genre.all
    @all_art = Artist.all
    @song = Song.find_by_slug(params[:slug])
    if @song
      erb :'/songs/edit'
    else
      redirect to "/songs"
    end
  end

  post "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])

    if params["song_genres"]
      if !params["song_genres"]["genres_id"].empty?
        params["song_genres"]["genres_id"].each do |gen|
          @song.genres << Genre.find(gen)
        end
      end
    end

    if !params["genre"]["name"].empty?
      @song.genres << Genre.create(name: params["genre"]["name"])
    end

    if !params["artist"]["name"].empty?
      #binding.pry
      @song.artist = Artist.find_or_create_by(name: params["artist"]["name"])
    end
    @song.save

    flash[:message] = "Successfully updated song."

    redirect "/songs/#{@song.slug}"
  end

end
