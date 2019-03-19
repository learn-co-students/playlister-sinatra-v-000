class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb :'genres/index'
  end

  get '/genres/:slug' do
    @genre = Genre.all.find_by_slug(params[:slug])
    @genre_songs = @genre.songs
    @genre_artists = @genre.artists
    erb :'genres/show'
  end


end
