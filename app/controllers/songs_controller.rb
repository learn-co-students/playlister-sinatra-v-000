class SongsController < ApplicationController

  get '/songs' do
    @all_songs ||=  Song.all

    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres ||= Genre.all
    erb :'/songs/new'
  end

  post '/songs' do
    @song = Song.new(params[:song])
    @artist = Artist.find_by(params[:artist])

    if !@artist
      @artist = Artist.new(params[:artist])
    end
    @song.artist = @artist

    params[:genres].each do |genre_id|
      @genre = Genre.find(genre_id)
      @song.genres << @genre
    end

    @song.save
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @genres ||= Genre.all
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find_by(params[:artist])

    if !@artist && (params[:artist][:name] != "")
      @artist = Artist.new(params[:artist])
    end

    @song.artist = @artist if !!@artist

    @song.genres.clear
    params[:genres].each do |genre_id|
      @genre = Genre.find(genre_id)
      @song.genres << @genre
    end

    @song.save
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end

end
