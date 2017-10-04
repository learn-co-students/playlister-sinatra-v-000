require 'pry'
require 'rack-flash'

class SongsController < ApplicationController

  use Rack::Flash
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  get '/songs' do
    @slugs = []
    Song.all.each { |song| @slugs << song.slug }
    @slugs
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  post '/songs' do
    if params["Artist Name"] != ""
      if Artist.find_by(name: params["Artist Name"])
        @artist = Artist.find_by(name: params["Artist Name"])
      else
        @artist = Artist.create(name: params["Artist Name"])
      end
      @song = Song.create(name: params["Name"], genre_ids: params[:genres], artist: @artist)
    else
      @song = Song.create(name: params["Name"], genre_ids: params[:genres])
    end
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist
    @genre_slugs = []
    @song.genres.each { |genre| @genre_slugs << genre.slug }
    @genre_slugs
    erb :'songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
      if Artist.find_by(name: params["Artist Name"])
        @artist = Artist.find_by(name: params["Artist Name"])
      else
        @artist = Artist.create(name: params["Artist Name"])
      end
    @song.update(name: params["Name"], genre_ids: params[:genres], artist: @artist)
    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end

end
