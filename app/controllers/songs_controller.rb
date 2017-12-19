class SongsController < ApplicationController

  get "/songs" do
    @songs = Song.all
    erb :'/songs/index'
  end

  get "/songs/new" do
    @song = Song.new
    erb :'songs/new'
  end

  get "/songs/:slug" do
    @song = Song.find_by_slug(params["slug"])
    erb :'songs/show'
  end

  post "/songs" do
    @song = Song.create(name: params[:name])
    @song.artist = Artist.find_or_create_by(name: params[:artist])
    @song.genre = Genre.find(name: params[:genre])
    flash[:message] = "Successfully updated"
    redirect "/songs/#{@song.slug}"
  end
end
