class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(name: params[:name])
    @genre = Genre.find_by(name: params[:genres][0])
    @song.genres << @genre
    if params[:new_artist_name].blank?
      @artist = Artist.find_by(params[:artist_name])
      @song.artist = @artist
    else
      @artist = Artist.create(name: params[:new_artist_name])
      @song.artist = @artist
    end
    @song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    binding.pry
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

end
