class SongsController < ApplicationController



  get "/songs" do
     @songs = Song.all
    erb :songs
  end

end
