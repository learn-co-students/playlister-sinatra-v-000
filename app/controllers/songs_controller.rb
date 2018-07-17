class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
   erb :'songs/new'
  end

  post '/songs' do
    binding.pry
    @song = Song.create(:name => params[:song][:name])
      @song.artist = Artist.find_or_create_by(:name => params[:artist][:name])
      @song.genres.ids = params[:genres]
      @song.save
    redirect "songs/#{@new_song.id}"
  end

  get '/songs/:id' do
    "hello"

 end



end
