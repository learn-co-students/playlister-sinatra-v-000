require 'pry'

class GenresController < ApplicationController

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  get '/genres' do
    @slugs = []
    Genre.all.each { |genre| @slugs << genre.slug }
    @slugs
    erb :'/genres/index'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    @artist_slugs = []
    @genre.artists.each { |artist| @artist_slugs << artist.slug }
    @artist_slugs
    @song_slugs = []
    @genre.songs.each { |song| @song_slugs << song.slug }
    @song_slugs
    erb :'genres/show'
  end

end
