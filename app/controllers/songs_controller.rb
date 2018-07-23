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
    if !!Artist.find_by(name: params["Artist Name"])
      @artist = Artist.find_by(name: params["Artist Name"])
      @song = Song.create(:name => params["Name"], :artist_id => @artist.id)
      @song.genres << Genre.find_by(id: params["Genre Name"])
      @song.save
    #  @song.genres.each do |genre|
    #  @songgenre = SongGenre.create(:song_id => @song.id, :genre_id => genre.id)
    #  @songgenre.save
      redirect to "/songs/#{@song.slug}"
    else
      @artist = Artist.create(:name => params["Artist Name"])
      artist_id = @artist.id
      @song = Song.create(:name => params["Name"],:artist_id => artist_id)
      @song.genres << Genre.find_by(id: params["Genre Name"])
      #@song.genres = @genre
    #  SongGenre.create(:song_id => @song.id, :genre_id => @genre.id)
      redirect to "/songs/#{@song.slug}"
    end
    @song.save
  end

  get '/songs/:slug/edit' do
      @song = Song.find_by_slug(params[:slug])
      erb :'/songs/edit'
    end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs/:slug' do
    erb :'/song/show'
  end




end
