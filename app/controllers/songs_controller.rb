class SongsController < ApplicationController
  get "/songs" do
    erb :"songs/index"
  end

  get "/songs/new" do
    erb :"songs/new"
  end

  post "/songs" do
    @song = Song.create(name: params[:name])
    @song.artist = Artist.find_or_create_by(name: params[:artist_name])
    flash[:message] = "Successfully created song."
    redirect to("/songs/#{@song.slug}")
  end

  get "/songs/:slug" do
    erb :"songs/show"
  end

  get "/songs/:slug/edit" do

  end
end
