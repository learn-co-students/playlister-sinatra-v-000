require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash


  get '/songs' do

    @songs = Song.all

    erb :'/songs/index'
  end

  get '/songs/new' do

    @genres = Genre.all
  erb :'/songs/new'
  end

  get '/songs/:slug/edit' do
      @song = Song.find_by_slug(params[:slug])
      @genres = Genre.all
      erb :'/songs/edit'
  end

  get '/songs/:slug' do
      @song = Song.find_by_slug(params[:slug])
      @genres = @song.genres
      @artist = @song.artist
      erb :'/songs/show'
    end

  post '/songs' do
    @song = Song.create(name: params[:name])
    @genre = Genre.find(params[:genre])
    @song.genres << @genre
    @artist = Artist.find_or_create_by(name: params[:artist])
    @song.artist = @artist
    @artist.save
    @song.save
    flash[:message] = 'Successfully created song.'
    redirect "/songs/#{@song.slug}"
  end

  patch '/songs/:slug' do
    @song = Song.find_by(name: params[:name])
    @song.artist = Artist.find_or_create_by(name: params[:artist_name])
    @song.genres.clear
      if !params[:genre].empty?
        genre = Genre.find_by(name: params[:genre])
        @song.genres << genre
      end
    @song.save

    flash[:message] = 'Successfully updated song.'

    redirect "/songs/#{@song.slug}"
  end

  patch '/songs' do
    binding.pry

    @song = Song.find_by(name: params[:name])
    flash[:message] = 'Successfully updated song.'

    redirect("/songs/#{@song.slug}")
  end





end
