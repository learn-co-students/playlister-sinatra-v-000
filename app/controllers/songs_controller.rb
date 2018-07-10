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
    if !params[:artist_id].empty?
      @song.artist_id = params[:artist_id]
    elsif !params[:artist_name].empty?
      new_artist =  Artist.create(name: params[:artist_name])
      @song.artist = new_artist
    end
    @song.save
    redirect "/songs/#{@song.id}"
  end

  get '/songs/:id' do
    #view specific song
    @song = Song.find(params[:id])
    erb :"/songs/show"
  end
end
