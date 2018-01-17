class SongsController < ApplicationController 
  
  get '/songs' do 
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do 
    @genres = Genre.all
    erb :'songs/new'
  end
  
  post '/songs' do 
    @song = Song.create(params[:song])
    @artist = Artist.find_or_create_by(name: params[:artist_name])
    @song.update(artist_id: @artist.id)
    flash[:message] = "Successfully created song." 
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do 
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all 
    erb :'/songs/edit' 
  end
 
  get '/songs/:slug' do 
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  patch '/songs/:slug' do 
    @song = Song.find_by_slug(params[:slug])  
    @song.update(params[:song])
    if params[:artist_name] != ""
      @artist = Artist.find_or_create_by(name: params[:artist_name])
      @song.update(artist_id: @artist.id)
    end
    flash[:message] = "Successfully updated song." 
    redirect to "/songs/#{@song.slug}"
  end

end