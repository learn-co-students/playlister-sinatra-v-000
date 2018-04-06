class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all

    erb :'songs/index'
  end

  get '/songs/:slug' do
    @song = Song.all
    @slug = params["slug"]

    #@deslug = @slug.split("-").map(&:capitalize).join(" ")

    erb :'songs/show'
  end

end
