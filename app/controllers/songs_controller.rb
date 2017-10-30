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

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do
    if !Song.find_by_slug(:name => params["Name"])
      @song = Song.find_or_create_by(:name => params["Name"])
      @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
      @song.genres = params["genres"].collect{|g|Genre.find_by(id: g.to_i)}
      @song.save
      flash[:message] = "Successfully created song."
      redirect "/songs/#{@song.slug}"
    end  
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'/songs/edit'
  end  

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
    @song.save
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end

 
end  # End of Class