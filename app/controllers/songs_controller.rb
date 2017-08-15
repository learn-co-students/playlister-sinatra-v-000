class SongsController < ApplicationController
  get "/songs" do
    @songs = Song.all
    erb :"/songs/index"
  end

  get "/songs/:slug" do
    @song = Song.create(params[:song]) #[:plug]
    erb :"/songs/show"
  end
end
