class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    Song.all.each do |song|
      song
      binding.pry
    end
    erb :'/songs/new'
  end

  post '/songs' do
    binding.pry
    @song = Song.create(params[:song])
    redirect "songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

end
