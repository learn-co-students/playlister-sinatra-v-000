class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/:slug' do
    #using collect to select multiple songs with the same name
    @songs = Song.all.select{|obj| obj.slug == params[:slug]}
    erb :'/songs/show'
  end

  get '/songs/new' do
    binding.pry
  end

   get '/songs/:slug/edit' do
     binding.pry
   end

end
