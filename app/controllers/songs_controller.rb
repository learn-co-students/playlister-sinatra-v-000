require 'rack-flash'

class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.create(params[:song])
    @artist = Artist.find_by(name: params[:artist][:name]) || Artist.create(params[:artist]) if !params[:artist][:name].empty?
    @song.artist = @artist if @artist

    params[:genres].each { |genre_id| @song.genres << Genre.find_by_id(genre_id) }

    @song.save

    flash[:message] = "Successfully created song."

    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist
    @genres = @song.genres
    erb :'/songs/show'
  end
end
