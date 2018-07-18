class SongsController < ApplicationController



  get "/songs" do
     @songs = Song.all
    erb :songs
  end

  get "/songs/new" do
    erb :songs_new
  end

  post "/songs/new" do
    # params Song.new(params...)
    #       Artist.new(params...)
    #       or find Artist
    redirect "/songs/:slug"
  end


  get "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    erb :songs_show
  end

end
