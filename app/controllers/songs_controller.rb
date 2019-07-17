class SongsController < ApplicationController

  get '/songs' do
    erb :"/songs/index"
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

  post '/songs' do
      @song = Song.create(name: params["Name"])
      @artist = Artist.create(:name => params["Artist Name"]) unless Artist.where(name: params["Artist Name"]).exists?

      @song.artist = @artist
      @song.genre_ids = params[:genres]

      redirect to "/songs/#{@song.slug}"
    # @song = Song.create(:name => params["Name"])
    # @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
    # @song.genre_ids = params[:genres]
    # @song.save
    #
    # redirect("/songs/#{@song.slug}")
  end


end
#
