require 'pry'
require 'rack-flash'

class ArtistsController < ApplicationController

  use Rack::Flash
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  get '/artists' do
    @slugs = []
    Artist.all.each { |artist| @slugs << artist.slug }
    @slugs
    erb :'/artists/index'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    @song_slugs = []
    @artist.songs.each { |song| @song_slugs << song.slug }
    @song_slugs
    @genre_slugs = []
    @artist.genres.each { |genre| @genre_slugs << genre.slug }
    @genre_slugs
    erb :'artists/show'
  end

end
