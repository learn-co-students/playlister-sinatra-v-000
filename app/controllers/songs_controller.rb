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
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs' do
    @song = Song.create(params[:song])
    if !params[:artist][:name].empty?
      if Artist.find_by(name: params[:artist][:name])
        @song.artist = Artist.find_by(name: params[:artist][:name])
      else
      @song.artist = Artist.create(params[:artist])
      end
    end
    @song.save
    flash[:message] = "Successfully created song."
     redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    if !params[:artist][:name].empty?
      if Artist.find_by(name: params[:artist][:name])
        @song.artist = Artist.find_by(name: params[:artist][:name])
      else
      @song.artist = Artist.create(params[:artist])
      end
    end
    @song.save
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end

end
