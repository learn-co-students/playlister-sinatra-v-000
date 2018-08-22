class SongsController < ApplicationController

  get "/songs" do
    @song = Song.all
    erb :"songs/index"
  end

  get "/songs/:slug" do

  end

  get "/songs/new" do

  end

end
