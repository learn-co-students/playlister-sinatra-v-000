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

  post '/songs' do #i dont think this can handle blank fields properly
    artist = Artist.find_or_create_by(name: params[:artist][:name])
    artist.save

    @song = Song.create(params[:song])
    if !params[:genre_ids].empty?
      @song.genres = params[:genre_ids].collect { |id| Genre.find(id)}
    end
    @song.artist = artist
    @song.save

    flash[:message] = "Successfully created song."
    redirect to "songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @genres = Genre.all
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  post '/songs/:slug' do
# puts "params= #{params}"

    @song = Song.find_by_slug(params[:slug])
    if params[:song][:name] != ""
      @song.name = (params[:name])
    end

    if params[:artist][:name] != ""
      artist = Artist.find_or_create_by(name: params[:artist][:name])
      artist.save
      @song.artist = artist
    end

    if params.key?(:genre_ids)
      @song.genres = params[:genre_ids].collect { |id| Genre.find(id)}
    end

    @song.save

    flash[:message] = "Successfully updated song."
    redirect to "songs/#{@song.slug}"
  end
end
