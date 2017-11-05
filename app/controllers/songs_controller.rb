class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
      erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs/:slug' do

    @song = Song.new(name: params[:song])
    @song.artist = Artist.find_or_create_by(name: params[:artist])

    genre = params[:genres].collect do |t|
      Genre.find_or_create_by(name: t)
    end

    @song.genres = genre
    @song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do

    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/#{@song.slug}/edit'
  end

  post '/songs/:slug/edit' do
    @song.name = params[:song]
    @song.artist = Artist.find_or_create_by(name: params[:artist])

    genre = params[:genres].collect do |t|
      Genre.find_or_create_by(name: t)
    end

    @song.genres = genre
    @song.save

    erb :'/songs/#{song.slug}'
  end
end
