class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    # binding.pry
    @artist = Artist.find_or_create_by(:name => params["Artist Name"])
    @genres = params['genres'].map {|genre| Genre.find(genre)}
    @song = Song.create(:name => params["Name"])#, :genres => @genres)
    @song.artist = @artist
    @song.genres = @genres
    @song.save
    # flash[:message] = "Successfully created song."
    # binding.pry
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

end
