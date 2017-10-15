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
    @song = Song.new(params[:song])
    @song.artist = Artist.find_or_create_by(params[:artist])
    @song.save
    redirect "/songs/#{@song.slug}"
  end

end
