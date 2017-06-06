require 'rack-flash'
class SongsController < ApplicationController
use Rack::Flash
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @song = Song.new
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    @song.artist = @artist
    @song.save
    flash[:message] = "Successfully updated song."
    redirect to("/songs/#{@song.slug}")

  end

  post '/songs' do
    @artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song = Song.create(name: params["Name"], artist: @artist)
    if !params["genres"].nil?
      params["genres"].each do |id|
        @genre = Genre.find(id)
        @song.genres << @genre
      end
    end
    flash[:message] = "Successfully created song."
    @message = "Successfully created song."
    redirect to("/songs/#{@song.slug}")
  end

end
