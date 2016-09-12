require 'rack-flash'
require 'pry'
class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
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
    @artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song = Song.find_or_create_by(name: params[:song][:name])
    if !@artist.songs.include?(@song)
        @artist.songs << @song
    end
    params[:genres].each do |genre_id|
      @genre = Genre.find_by_id(genre_id)
      @song.genres << @genre
    end
    @artist.save
    @song.save

    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  post '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find_by_id(@song.artist.id)
    @artist.name = params[:artist][:name]
    @song.name = params[:song][:name]
  
    if !params[:genres].empty?
      @song.genres = []
      params[:genres].each do |genre|
        @song.genres << Genre.find_by_id(genre)
      end
    end
    @artist.save
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
end

end
