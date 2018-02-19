class SongsController < ApplicationController

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :"/songs/new"
  end

  get '/songs' do
    @songs = Song.all
    erb :"/songs/index"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :"/songs/show"
  end


  post '/songs' do
    # binding.pry
    @song = Song.create(name: params["Name"])
    # binding.pry
    @artist = Artist.find_by(name: params["Artist Name"])
    @song.artist = !@artist ? Artist.create(name: params["Artist Name"]) : @artist
    # binding.pry
    @song.genre_ids = params[:genres]
    @song.save

    flash[:message] = "Successfully created song."
    # binding.pry
    redirect to "/songs/#{@song.slug}"
  end

end
