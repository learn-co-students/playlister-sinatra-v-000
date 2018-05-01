class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  post '/songs' do
    @song = Song.find_or_create_by(name: params[:song][:name])
    @artist = Artist.find_or_create_by(name: params[:song][:artist])
    @song.artist = @artist
    params[:genres].each do |genre|
      @genre = Genre.find_by(name: genre)
      @song.genres << @genre
    end
    @song.save
    flash[:message] = "Successfully created song."
    session["flash"] = flash[:message]
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/new' do
    erb :'/songs/new'
  end
  
  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist
    @genres = @song.genres
    binding.pry
    erb :'/songs/show'
  end
end
