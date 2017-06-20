class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    # binding.pry
    erb :'songs/index'
  end

  get '/songs/new' do
    # @artists = Artist.all
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs' do
    @artist = Artist.find_or_create_by(name: params[:song][:artist])
    @song = @artist.songs.build(name: params[:song][:name])
    @genre = Genre.find_by(id: params[:song][:genres])
    @song.genres << @genre
    @artist.save
    # binding.pry
    flash[:message] = "Successfully created song."
    redirect to("/songs/#{@song.slug}")
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    # binding.pry
    erb :'/songs/show'

  end
end
