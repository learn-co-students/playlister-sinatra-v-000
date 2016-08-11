class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :"/songs/index"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :"/songs/show"
  end

  post '/songs' do

    @song = Song.new(:name => params[name])
    
    @song.genres =

    redirect to("/songs/#{@song.slug}")
  end

end
