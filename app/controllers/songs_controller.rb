class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :"songs/index"
  end

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :"songs/new"
  end

  post '/songs' do
    @song = Song.new(name: params[:name])
    @song = Song.create(:name => params["Name"])
    @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
    @song.genre_ids = params[:genres]
    @song.save
    redirect "/songs/#{@song.id}"
  end

  get '/songs/:slug' do
    #view specific song
    @song = Song.find_by_slug(params[:slug])
    erb :"/songs/show"
  end
end
