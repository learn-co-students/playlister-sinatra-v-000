
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

  post '/songs' do
    @song = Song.create(name: params["Name"])
    if @artist = Artist.find_by_name(params["Artist Name"])
      @song.artist = @artist
    else
      @artist = Artist.create(name: params["Artist Name"])
      @song.artist = @artist
    end
    @genre = Genre.find_by_id(params["genres"])
    @song.genres << @genre
    @song.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end


  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.artist.update(name: params["Artist Name"])
    @song.genre_ids = params["genres"]
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end

end
