class GenresController < ApplicationController
  get '/genres' do
    @genres = Genre.all
    erb :"genres/index"
  end

  get '/genres/:slug' do
    slug = params[:slug]
    #binding.pry
    @genre = Genre.find_by_slug(slug)
    @artists = @genre.artists.all
    @songs = @genre.songs.all

    erb :"genres/show"
  end




end
