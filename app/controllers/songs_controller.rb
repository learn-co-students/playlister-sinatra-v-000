class SongsController < ApplicationController

  get '/songs' do
    erb  :'/songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    #LibraryParser.parse
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do

    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    if Artist.find_by(name: params[:artist_name])
      @song.artist = Artist.find_by(name: params[:artist_name])
    else
      @song.artist = Artist.create(name: params[:artist_name])
    end
    @song.save

  #  binding.pry

    #@song.genres.clear
    #params[:genres].each do |genre|
      #if !@song.genres.include?(Genre.find(genre))
    #    @song.genres << Genre.find(genre)
      #end
    #end

    #@song.save

    redirect to("/songs/#{@song.slug}")

  end


  post '/songs' do
    @song = Song.new(name: params[:song_name])

    if Artist.find_by(name: params[:artist_name])
      @song.artist = Artist.find_by(name: params[:artist_name])
    else
      @song.artist = Artist.create(name: params[:artist_name])
    end

    params[:genres].each do |genre|
      @song.genres << Genre.find(genre)
    end
    @song.save
    flash[:message] = "Successfully created song."
    redirect to("/songs/#{@song.slug}")
  end

end
