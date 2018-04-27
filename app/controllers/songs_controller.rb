

class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @songs = Song.all
    erb :'/songs/new'
  end

  post '/songs' do

    if Artist.find_by_name(params[:artist][:name]) == nil
      song = Song.create(name: params[:song][:name])
      song.genres << Genre.find(params[:genre])
      artist = Artist.create(name: params[:artist][:name])
      artist.songs << song
      artist.save
      song.save
      flash[:message] = "Successfully created song."
      redirect "songs/#{song.slug}"

    elsif Artist.find_by_name(params[:artist][:name]) != nil
      song = Song.create(name: params[:song][:name])
      song.genres << Genre.find(params[:genre])
      artist = Artist.find_by_name(params[:artist][:name])
      artist.songs << song
      artist.save
      song.save

      flash[:message] = "Successfully created song."

      redirect "songs/#{song.slug}"
    end
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])

    erb :'/songs/edit'
  end

  post '/songs/:slug' do
    @song = Song.find_by_name(params[:song][:name])

    @song.genres.clear
    params[:genres].each do |genre_id|
      @song.genres << Genre.find(genre_id)
      @song.save
    end

    if !Artist.all.include?(params[:artist])
      artist = Artist.create(params[:artist])
      @song.artist = artist
      @song.save
    end

    @song.save

    flash[:message] = "Successfully updated song."
    redirect "songs/#{@song.slug}"
  end


  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

end
