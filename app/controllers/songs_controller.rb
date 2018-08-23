class SongsController < ApplicationController

  get "/songs" do
    @song = Song.all
    erb :"songs/index"
  end

  post '/songs' do
    # ...
    # ^ code for creating and saving a new song
    flash[:message] = "Successfully created song."
    redirect to("/songs/#{@song.slug}")
  end

  get "/songs/:slug" do

  end

  get "/songs/new" do

  end

end
