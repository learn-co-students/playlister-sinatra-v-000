class SongsController < ApplicationController

  get '/songs' do
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    #binding.pry
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  post '/songs' do
    @song = Song.find_or_create_by(name: params[:Name])
    @artist = Artist.find_or_create_by(name: params[:"Artist Name"])
    @song.artist = @artist
    #binding.pry
    params[:genre].each do |genre|
      @genre = Genre.find_or_create_by(name: genre)
      #@artist.genres << @genre
      @songgenre = SongGenre.create(:song_id => @song.id, :genre_id => @genre.id)
    end
    @song.save
    @message = params[:message]
    #binding.pry
    redirect to "/songs/#{@song.slug}"
  end

  patch '/songs' do
    #binding.pry
    @song = Song.find_or_create_by(name: params[:Name])
    @artist = Artist.find_or_create_by(name: params[:"Artist Name"])
    @song.artist = @artist
    #binding.pry
    if params[:genre] != nil
      params[:genre].each do |genre|
        @genre = Genre.find_or_create_by(name: genre)
        #@artist.genres << @genre
        @songgenre = SongGenre.create(:song_id => @song.id, :genre_id => @genre.id)
      end
    end
    @song.save
    @message = params[:message]
    #binding.pry
    redirect to "/songs/#{@song.slug}"
  end

end
