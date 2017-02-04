class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(name: params["song"]["name"].split(" ").map(&:capitalize).join(' '))
    if !Artist.find_by_name(params["artist"]["name"]).present?
      @song.artist = Artist.create(name: params["artist"]["name"])
    else
      @song.artist = Artist.find_by_name(params["artist"]["name"])
    end

    if !params["genres"].empty?
      params["genres"].each do |genre|
        SongGenre.create(song_id: @song.id, genre_id: genre)
      end
    end
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
    @song = Song.find_by_slug(params[:slug])
    if !Artist.find_by_name(params["artist"]["name"]).present?
      @song.artist = Artist.create(name: params["artist"]["name"])
    else
      @song.artist = Artist.find_by_name(params["artist"]["name"])
    end
    @song.save

    @song.genres.clear
    params["genres"].each do |id| 
      @song.genres << Genre.find_by_id(id)
    end
    
    flash[:message] = "Successfully updated song."
    erb :'/songs/show'
  end

end





