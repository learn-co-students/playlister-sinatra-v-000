class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :"/songs/index"
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :"/songs/new"
  end

  post '/songs' do
    @song = Song.new(name: params["Name"])

    if !!Artist.find_by(name: params["artist_name"])
      @song.artist = Artist.find_by(name: params["artist_name"])
    else
      @song.artist = Artist.new(name: params["artist_name"])
    end

    params["genre_ids"].each do |genre_id|
      @song.genres << Genre.find(genre_id.to_i)
    end

    @song.save

    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    binding.pry
    @song = Song.find_by_slug(params[:slug])
    erb :"/songs/show"
  end

end
