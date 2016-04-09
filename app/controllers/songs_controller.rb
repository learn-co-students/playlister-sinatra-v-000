class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end
 
  post '/songs' do 
    @song = Song.create(params[:song])
    if !params[:artist][:name].empty?
      @artist = Artist.create(params[:artist])
      @artist.songs << @song
    end
    redirect to "songs/#{@song.id}"
  end
 
  post '/songs' do
    redirect to '/songs'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(slug = params["slug"])
    @artist = Artist.find(@song.artist_id)
    @sg_ary = []
    SongGenre.all.each do |sg| 
      if sg.song_id == @song.id
        @sg_ary << sg 
      end 
      @sg_ary
    end
    erb :'/songs/show'
  end
 
end