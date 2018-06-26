class SongsController < ApplicationController
  
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end
  
  get '/songs/new' do
    erb :'songs/new'
  end
  
  post '/songs' do 
    @song = Song.new(params[:song])
    binding.pry
    if !params["artist_name"].empty?
      @song.artist << Artist.create(name: params["artist_name"])
    end
    @song.save
    redirect to "/songs/#{@song.slug}"
  end
  
  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end
  
end
