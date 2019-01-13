class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  # post '/songs' do
  #   @song = Song.create(:name => params["Name"])
  #   @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
  #   @song.genre_ids = params[:genres]
  #   @song.save
  #   flash[:message] = "Successfully created song."
  #   redirect to("/songs/#{@song.slug}")
  # end

  post '/songs' do
    @song = Song.create(name: params["Name"])
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    # @song.genres = params[:genre_ids]
    # if !params["Genre Name"].empty?
    #   @song.genres << Genre.create(name: params["Genre Name"])
    # end
    # @song.slug
    @song.save
    flash[:message] = "Successfully created song."

    redirect "/songs/#{@song.slug}"
  end



end
