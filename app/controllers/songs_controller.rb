class SongsController < ApplicationController

  get '/songs' do
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs' do
    # binding.pry
    @song = Song.create(params[:song])
    if !params[:artist][:name].empty?
      @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    end
    @song.save
  end
end
