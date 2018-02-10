class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb:'songs/index'
  end

  get '/songs/:slug' do
    slug = params[:slug]
    #binding.pry
    @song = Song.find_by_slug(slug)
    erb :'songs/show'
  end
end
