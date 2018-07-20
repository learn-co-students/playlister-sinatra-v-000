class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end


  get '/songs/new' do
    @songs = Song.all
    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
    if Artist.find_by(name: params["Artist Name"])
      @artist = Artist.find_by(name: params["Artist Name"])
      @song = Song.create(:name => params["Name"], :artist_id => @artist.id)
    else
      @artist = Artist.create(:name => params["Artist Name"])
      artist_id = @artist.id
      @song = Song.create(:name => params["Name"],:artist_id => artist_id)
      SongGenres.create(:song_id => @song.id)
    end
    @song.save
    redirect to "songs/#{@song.slug}"
  end


  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end


end
