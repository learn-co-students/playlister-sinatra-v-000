class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @songs = Songs.all
   erb :'/songs/new'
  end

  get '/songs/:slug' do
    #using collect to select multiple songs with the same name
    @songs = Song.all.select{|obj| obj.slug == params[:slug]}
    erb :'/songs/show'
  end


end
