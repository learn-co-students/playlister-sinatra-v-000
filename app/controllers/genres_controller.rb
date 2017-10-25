class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb :'genres/index'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    @g_songs = @genre.songs
    @g_artists = @genre.artists
    erb :'genres/show'
  end
end
