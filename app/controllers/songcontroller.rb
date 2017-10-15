class SongController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/songlist'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
    flash[:message] = "Successfully created song."
    redirect to("/songs/#{@song.slug}")
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artists = @song.artist
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    erb :'songs/edit'
  end

end
