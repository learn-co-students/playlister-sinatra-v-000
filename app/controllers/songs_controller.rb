class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all

    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  post '/song' do
    @song = Song.create(params[:song])
    @song.genre = params[:genres].join

    @artist = Artist.all.find {|a| a.name == params[:artist][:name]}

    if @artist
      @song.artist = @artist
      @song.save
    else
      @song.artist = Artist.create(params[:artist])
      @song.save
    end


    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.all.find_by_slug(params[:slug])
    @song_artist = @song.artist
    @song_genres = @song.genres
    erb :'songs/show'

  end

  get '/songs/:slug/edit' do
    erb :'songs/edit'
  end

end
