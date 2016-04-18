require 'pry'
class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do
    @song = Song.create(name: params[:name])
    if !params[:artist].empty?
      @song.artist = Artist.create(name: params[:artist])
    end
    if !params[:genres].empty?
      params[:genres].each do |genre|
        genre_id = genre.to_i
        genre_name = SongGenre.find_by(genre_id: genre_id).genre.name
        @song.genres << Genre.create(name: genre_name)
      end
    end
    @song.save
    erb :index, locals: {message: "Successfully created song."}
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    if !params[:artist][:name].empty?
      @song.artist = Artist.create(name: params[:artist])
    end
    if !params[:genre][:name].empty?
      genre_name = params[:genre][:name]
      @song.genres << Genre.create(name: genre_name)
    end
    erb :'songs/show', locals: {message: "Song successfully updated."}
  end
end