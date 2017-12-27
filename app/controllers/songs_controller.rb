class SongsController < ApplicationController


  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
    if !params[:new_artist].empty?
      @artist = Artist.find_or_create_by(name: params[:new_artist])
    else
      @artist = Artist.find_or_create_by(name: params[:artist])
    end
    @song = Song.create(name: params[:name])
    @genre = Genre.find_or_create_by(name: params[:genre])
    @song.artist = @artist
    @song.genres << @genre
    @song.save
    session[:success_message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @success_message = session[:success_message]
    session[:success_message] = nil
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    @artists = Artist.all
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
      if !params[:new_artist].empty?
        @artist = Artist.find_or_create_by(name: params[:new_artist])
      else
        @artist = Artist.find_or_create_by(name: params[:artist])
      end
    @genre = Genre.find_or_create_by(name: params[:genre])
    @song.artist = @artist
    @song.genres << @genre if !@song.genres.include?(@genre)
    @song.save
    session[:success_message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end



end
