require 'pry'
class SongsController < ApplicationController

  get '/songs' do
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs/new' do
    @song = Song.new(name: params[:song][:name])
    if !!params[:song][:artist_id]
      @artist = Artist.find(params[:song][:artist_id])
    else
      @artist = Artist.new(name: params[:song][:artist])
    end
    @song.artist = @artist
    if !!params[:song][:genre_ids]
      params[:song][:genre_ids].each do |id|
        @genre = Genre.find(id)
        @song.genres << @genre
      end
    end
    if params[:genre][:name] != "" && !Genre.find_by(name: params[:genre][:name])
      @genre = Genre.new(name: params[:genre][:name])
      @song.genres << @genre
    elsif params[:genre][:name] != ""
      @genre = Genre.find_by(name: params[:genre])
      @song.genres << @genre
    end
    @song.save
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    if @song.name != params[:name] && params[:name] != ""
      @song.name = params[:name]
    end
    if @song.artist.name != params[:artist] && params[:artist] != ""
      if !Artist.find_by(name: params[:artist])
        @artist = Artist.new(name: params[:artist])
      else
        @artist = Artist.find_by(name: params[:artist])
      end
      @song.artist = @artist
    end
    @song.genres = []
    if !!params[:genre]
      params[:genre].each do |id|
        @genre = Genre.find(id)
        @song.genres << @genre
      end
    end
    if !@song.genres.include?(params[:genre_input]) && params[:genre_input] != ""
      if !Genre.find_by(name: params[:genre_input])
        @genre2 = Genre.new(name: params[:genre_input])
      else
        @genre2 = Genre.find_by(name: params[:genre_input])
      end
      @song.genres << @genre2
    end
    @song.save
    redirect "/songs/#{@song.slug}"
  end



end
