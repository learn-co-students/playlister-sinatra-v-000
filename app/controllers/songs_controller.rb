class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    # binding.pry
    @artist = Artist.find_or_create_by(name: params[:song][:artist])
    @song = @artist.songs.build(name: params[:song][:name])
    @genre = Genre.find_by(id: params[:song][:genres])
    @song.genres << @genre
    @artist.save
    flash[:message] = "Successfully created song."
    redirect to "songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    if params[:song][:artist] != @song.artist.name
      @artist = Artist.find_or_create_by(name: params[:song][:artist])
      @artist.songs << @song
      @artist.save
    end
    flash[:message] = "Successfully updated song."
    redirect to "songs/#{@song.slug}"
  end

end
