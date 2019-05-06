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
  
  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end
  
  post '/songs/new' do
    #binding.pry
    @song = Song.create(:name => params[:song_name])
    if !params[:new_artist].empty?
      @artist = Artist.create(:name => params[:new_artist])
    else
      @artist = Artist.find_by(:name => params[:existing_artist])
    end
    @song.artist = @artist
    @song.save
    redirect to "/songs/#{@song.slug}"
  end
  

end