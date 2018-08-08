class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do

    @genres = Genre.all

    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do
    binding.pry
    if Artist.find_by_name(params[:artist_name]) == nil
      @artist = Artist.create(name: params[:artist_name])
      @song = Song.create(name: params[:Name])
      params
#create array
#prevent dup
##prevent blanks
#save relationshp between genre and song
      @song.artist = @artist
      @song.save
    else
      @artist = Artist.find_by_name(params[:artist_name])
      @song = Song.create(name: params[:Name])
      @song.artist = @artist
      @song.save

    end
     redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:id/edit' do
    @song = Song.find_by_slug(params[:id])
    erb :'songs/edit'
  end

  patch '/songs/:id' do
binding.pry
    @song = Song.find_by_slug(params[:id])
    params

  end

end
