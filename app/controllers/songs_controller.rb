class SongsController < ApplicationController



  get "/songs" do
     @songs = Song.all
    erb :songs
  end

  get "/songs/:slug" do
    slug = params[:slug]
    @song = Song.find_by_slug(slug)
    erb :songs_show
  end

end
