class GenresController < ApplicationController

  get '/genres' do
    #Lists all genres.
    #Genres will be clickable.
    @genres = Genre.all
    erb :'/genres/index'
  end

  get '/genres/new' do
    erb :'/genres/new'
  end

  get '/genres/:slug' do
    @genre = Genre.all.find_by_slug(params[:slug])
    @songs = @genre.songs
    erb :'/genres/show'
  end

end
