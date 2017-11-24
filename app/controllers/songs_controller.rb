class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
   erb :'/songs/new'
  end

  patch '/songs/new' do
    binding.pry
  end

  get '/songs/:slug' do
    #using collect to select multiple songs with the same name
    @songs = Song.all.select{|obj| obj.slug == params[:slug]}
    erb :'/songs/show'
  end

end
