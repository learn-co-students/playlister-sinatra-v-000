class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs' do
    @artist = Artist.find_or_create_by(:name => params["Artist Name"])
    @genres = params['genres'].map {|genre| Genre.find(genre)}
    @song = Song.create(:name => params["Name"])#, :genres => @genres)
    @song.artist = @artist
    @song.genre_ids = params["genres"]
    @song.save
    flash[:message] = "Successfully created song."
    redirect to("/songs/#{@song.slug}")
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @genres = Genre.all #load edit form
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do #edit action
    @artist = Artist.find_or_create_by(:name => params["Artist Name"])
    # @genres = params['genres'].map {|genre| Genre.find(genre)}
    @song = Song.find_by_slug(params[:slug])
    @song.artist = @artist
    @song.genre_ids = params["genres"]
    @song.save

    # binding.pry
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end

end
