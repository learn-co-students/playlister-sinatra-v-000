class SongsController < ApplicationController
  get "/songs" do
    @songs = Song.all
    erb :"/songs/index"
  end

  get '/songs/new' do
    #@song = Song.create(params[:song]) #[:slug]
    erb :'/songs/new'
  end

  get "/songs/:slug" do
    #binding.pry
    @song = Song.find_by_slug(params["slug"])

    erb :"/songs/show"
  end

end
