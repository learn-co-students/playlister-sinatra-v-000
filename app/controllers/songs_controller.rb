class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    #binding.pry
    @song = Song.create(params[:song])

    @artist = Artist.find_by name: params[:artist][:name]

    if !!@artist
      @song.artist = @artist
    else
      @artist = Artist.create(params[:artist])
      @song.artist = @artist
    end
    # add each genre to song.genres
    @song.save

    flash[:message] = "Successfully created song."
    redirect to "songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  get '/songs/:slug' do
    #binding.pry
    @song = Song.find_by_slug(params[:slug])
    #binding.pry
    erb :'/songs/show'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params["song"])

    @artist = Artist.find_by name: params[:artist][:name]

    if !!@artist
      @song.artist = @artist
    else
      @artist = Artist.create(params[:artist])
      @song.artist = @artist
    end
    # add each genre to song.genres
    @song.save
    # look up artist by name
    # set song.artist
    # add each genre to song.genres

    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end
end
