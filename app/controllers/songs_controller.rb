require 'rack-flash'
class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  post '/songs' do
    @song = Song.create(:name => params[:song_name])
    @artist = Artist.find_or_create_by(:name => params[:artist_name])
    @song.artist = @artist
    if !!params[:genres]
      params[:genres].each do |id|
        @genre = Genre.find(id.to_i)
        @song.genres << @genre
      end
    end
    @song.save

    flash[:message] = "Successfully created song."
    redirect ("/songs/#{@song.slug}")
  end

  patch '/songs/:id' do
    @song = Song.find(params[:id])
    @artist = Artist.find_or_create_by(:name => params[:artist_name])
    @song.artist = @artist
    if !!params[:genres]
      params[:genres].each do |id|
        @genre = Genre.find(id.to_i)
        @song.genres << @genre
      end
    end
    @song.save

    flash[:message] = "Successfully updated song."
    redirect ("/songs/#{@song.slug}")
  end


end
