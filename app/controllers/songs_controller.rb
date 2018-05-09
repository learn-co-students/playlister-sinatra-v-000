class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist
    binding.pry
    erb :'songs/show'
  end

  post '/songs' do
    @song = Song.create(:name => params[:song][:name])
    @song.artist = Artist.create(:name => params[:artist][:name])
    @song.genre_ids = params[:genres]
    @song.save

    redirect to "/songs/#{@song.slug}" #not redirecting properly
  end



end
