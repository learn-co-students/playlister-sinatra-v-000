class SongsController < ApplicationController
	get '/songs' do
    @songs = Song.all
    erb :'/songs/index' 
  end

  get '/songs/new' do 
    @artists = Artist.all
    erb :'/songs/new'
  end

  post '/songs' do 
    @song = Song.new(name: params[:name])
    
    if !params["artist"]["name"].empty?
      @song.artist = Artist.create(name: params["artist"]["name"])
    end
    flash[:message] = "New artist added: #{@song.artist.name}"
    if !params["genre"]["name"].empty?
      @song.genres << Genre.create(name: params["genre"]["name"])
    end
    @song.save
    flash[:message] = "Successfully created new song: #{@song.name}."
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
    @song.update(params[:song])
    if !params["artist"]["name"].empty?
      @song.artist = Artist.create(name: params["artist"]["name"])
    end
    if !params["genre"]["name"].empty?
      @song.genres << Genre.create(name: params["genre"]["name"])
    end
    @song.save
    redirect to "/songs/#{@song.slug}"
  end
end