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

    params["genre_ids"].each do |genre_id|
      @song.genres << Genre.find(genre_id.to_i)
    end

    binding.pry

    @song.save
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :"/songs/show"
  end

end
