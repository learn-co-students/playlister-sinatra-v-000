class SongsController < ApplicationController


  get '/songs' do 
    @songs = Song.all

    erb :'/songs/index'
  end

  get '/songs/new' do 
   # binding.pry

    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @songs = Song.find_by_slug(params[:slug])
    
    erb :'/songs/show'
  end



  post '/songs/new' do 
    @new_song = Song.create(name: params[:song])
    #binding.pry
    @new_artist = Artist.create(name: params["artist"]["name"])      
    @new_song.artists << @new_artist

    # if !params["artist"]["name"].empty?
    #   @song.artists << Artist.create(name: params["song"]["artist"])
    # end
    #@new_song.save

    redirect to "/songs/:slug"
  end


  get '/songs/:id/edit' do



  end


end


