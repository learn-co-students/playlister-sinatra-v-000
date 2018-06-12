class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @songs = Song.all
    @artists = Artist.all
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(params['song'])
    if !params["artist"]["name"].empty?
      @song.artist = Artist.find_or_create_by(name: params["artist"]["name"])
    end
    @song.genre_ids = params['genre']
    @song.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @songs = Song.all
    @artists = Artist.all
    @genres = Genre.all
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
      if !params[:artist][:name].empty?
        @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
      end
    @song.name = params([:name])
    @song.artist = params([:artist])
    @song.genre = params([:genre])
    @song.save
    flash[:message] = "Successfully edited song."
    redirect to "/songs/#{@song.slug}"
  end

end
