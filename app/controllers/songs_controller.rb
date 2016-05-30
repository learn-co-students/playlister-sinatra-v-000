class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  post '/songs' do
    @song = Song.create(:name => params[:name])
    redirect "/songs/#{@song.slug}"
  end

end
