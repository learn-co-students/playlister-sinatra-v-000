require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.all.find {|instance| instance.slug == params[:slug]}
    erb :'/songs/show'
  end

  post '/songs/:slug' do
    @song = Song.create(name: params[:name])
    @genre = Genre.create(name: params[:genres])
    @song.genres << @genre
    if Artist.all.find {|instance| instance.name == params[:artist]}
      @song.artist = Artist.all.find {|instance| instance.name == params[:artist]}
    else
      @artist = Artist.create(name: params[:artist])
      @song.artist = @artist
    end
    @song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.all.find {|instance| instance.slug == params[:slug]}
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.all.find {|instance| instance.name == params[:name]}
    @song.update(name: params[:name])
    if !params[:artist].empty?
      @song.artist = Artist.find_or_create_by(name: params[:artist])
    end
    @song.genres.clear
    @song.genres << Genre.all.find_by(name: params[:genres])
    @song.save
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end
end