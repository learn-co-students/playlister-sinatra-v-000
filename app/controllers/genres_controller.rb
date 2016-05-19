class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb :'/genres/index'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    @artist = Artist.find_by_name(@genre.artists.first.name)
    @song = Song.find_by_name(@genre.songs.first.name)
    #binding.pry
    erb :'/genres/show'
  end
end
