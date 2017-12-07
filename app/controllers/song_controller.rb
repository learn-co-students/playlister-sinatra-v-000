require 'rack-flash'

class SongController < ApplicationController

  enable :sessions
  use Rack::Flash

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
      @song.artist = Artist.create(params["artist"])
      @song.save
    end

    if params["genre"]["name"] == ""
      params["genres"].each_with_index do |g, i|
        @song.genres << Genre.find(params["genres"][i])
        @song.save
      end
    end

    if params["genre"]["name"] != nil
      @song.genres << Genre.create(params["genre"])
      @song.save
    end

    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end



end
