class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end
  get '/songs/new' do
    erb :'songs/new'
  end

  post '/songs' do
    @song = Song.create(params[:song])

    if !params["artist"]["name"].empty?
      @song.artist = Artist.find_by(name: params["artist"]["name"])
      if @song.artist == nil
        @song.artist = Artist.create(name: params["artist"]["name"])
      end
    end
    @song.save
    flash[:message] = "Successfully created song."
    redirect to  "songs/#{@song.slug}"

  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'

  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end


  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
@song.artist= Artist.find_or_create_by(params[:artist])
    @song.update(params[:song])
    flash[:message] = "Successfully updated song."

    redirect to "songs/#{@song.slug}"
  end


end
