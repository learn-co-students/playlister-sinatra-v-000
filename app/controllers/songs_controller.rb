class SongController < ApplicationController

  get '/songs' do
      @songs =  Song.all
       erb :'songs/index'
  end

  get '/songs/new' do
    #   binding.pry
      erb :'songs/new'
  end

  post '/songs/:slug' do #or /songs/new to post to?
    #   binding.pry
      erb :'songs/show'
  end

  get '/songs/:slug' do #may have to change the order of :slug and new
     @song = Song.find_by_slug(params[:slug])
     erb :'songs/show'
 end
end
