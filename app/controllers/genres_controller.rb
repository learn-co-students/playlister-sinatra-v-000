class ApplicationController < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/genres' do
    @genres = Genre.all
    erb :'/genres/index'
  end

  get '/genres/new' do
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    @sgs = []
    @songs = []
    @artists = []
    SongGenre.all.each do |sg|
      if sg.genre_id == @genre.id
        @sgs << sg
      end
    end

    @sgs.each do |sgs|
      song = Song.find(sgs.song_id)
      @songs << song
      artist = Artist.find(song.artist_id)
      @artists << artist
    end

    erb :'/genres/show'
  end

end
