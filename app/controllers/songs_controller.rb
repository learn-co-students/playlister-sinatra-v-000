class SongsController < ApplicationController
  
  get "/songs/new" do
    @songs = Song.all
    erb :'songs/new'
  end
 
   post '/songs' do
     @songs = Song.create(params[:song])
     @songs.save

    redirect "songs/#{@song.id}"
   end
 
   get "/songs" do
      @songs = Song.all
      erb :'songs/index'
    end
end