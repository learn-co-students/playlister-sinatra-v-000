require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash
  

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song=Song.find_by_slug(params[:slug])
    
    erb :'songs/show'
  end

  post '/songs' do
    @song = Song.create(params[:song])

    if !params[:artist].empty?
      @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    end
    
    if !params[:genre][:name].empty?
      @song.genres << Genre.create(name: params[:genre][:name])
    else
      @song.genre_ids = params[:genres]
    end
    
    @song.save
    
    flash[:message] = "Successfully created song."
    redirect to("/songs/#{@song.slug}")
    
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genre = Genre.find_by(id: @song.genre_ids)
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    if !params[:song][:name].empty?
      @song = Song.update(params[:song][:name])
    elsif !params[:artist][:name].empty?
      @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    elsif !params[:genre][:name].empty?
      @song.genres << Genre.find_or_create_by(name: params[:genre][:name])
    else
      @song.genre_ids = params[:genres]
    end

    @song.save
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
    end

end
