class SongsController < ApplicationController

  get '/songs' do
    erb :"/songs/index"
  end

  post '/songs' do
    if !params["Artist Name"].empty?
      @artist = Artist.create(:name => params["Artist Name"])
      @song = Song.create(params)
    end

    binding.pry

    redirect "/songs/#{@song.slug}"

  end

  get '/songs/new' do
    erb :"/songs/new"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find(@song.artist_id)
    @genres = @song.songs_genres
    erb :"/songs/show"
  end


end
