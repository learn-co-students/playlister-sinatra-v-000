
class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs/:slug' do 
    @song = Song.find_by_slug(params[:slug])
    flash[:message] = "Successfully created song."
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @genres = Genre.all
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  post '/songs' do
    if ((artist = Artist.find_or_create_by(name: params[:song][:artist])) && !artist.errors.any?)
      params[:song][:artist] = artist
      song = Song.new(params[:song])
      song.save
      @songs = Song.all
      flash[:message] = "Successfully created song.: #{song.name}, by #{song.artist.name}, with genres #{song.genres.map{|g| g.name}.join(" ")}"
      # erb :"songs/show"
      # redirect "/songs/#{song.slug}"
      @target = song
      redirect "/songs/#{song.slug}"
    else
      redirect '/songs'
    end
  end

  patch '/songs/:slug' do
    if @song = Song.find_by_slug(params[:slug])
      if ((artist = Artist.find_or_create_by(name: params[:song][:artist])) && !artist.errors.any?)
        params[:song][:artist] = artist
        @song.update(params[:song])
        flash[:message] = "Successfully updated song.: #{@song.name}, by #{@song.artist.name}, with genres #{@song.genres.map{|g| g.name}.join(" ")}"
        erb :"songs/show"
      else
        @errors = true
        erb :"songs/edit"
      end
    else
      redirect '/songs'
    end
  end


end
