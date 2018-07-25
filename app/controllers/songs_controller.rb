
class SongsController < ApplicationController

  get "/songs" do
    @songs = Song.all
    erb :"/songs/index"
  end

  get "/songs/new" do
    binding.pry
    @genres = Genres.all
    erb :"/songs/new"
  end

  get "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/show"
  end

  post "/songs" do
    binding.pry

    redirect "/songs/:slug"
  end

end
