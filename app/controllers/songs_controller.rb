class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs' do
    artist = Artist.find_or_create_by!(name: params[:artist][:name])

    @song = Song.new(name: params[:song][:name], artist: artist)
    @song.genre_ids = params[:genres]
    @song.save!
    
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all

    erb :'/songs/edit'
  end

  post '/songs/:slug' do
    artist = Artist.find_or_create_by!(name: params[:artist][:name])
    @song = Song.find_by_slug(params[:slug])
    @song.genre_ids = params[:genres]
    @song.artist = artist
    @song.save!

    flash[:message] = "Successfully updated song."

    redirect "/songs/#{@song.slug}"
  end
end