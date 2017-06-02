require 'rack-flash'
class SongsCollector < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  post '/songs/:slug'do

    @song = Song.find_by_slug(params[:slug])
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    if @song.artist
    end
    @song.genre_ids = params[:song][:genre_ids]

    @song.save
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end

  post '/songs' do

    @song = Song.new(name: params[:Name])

    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])

    @genres = Genre.find(params[:genres])
    @song.genres << @genres if @genres

    @song.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end

  get "/songs/:slug" do
     @slug_song = Song.find_by_slug(params[:slug])
     erb :'/songs/show'
  end

end
