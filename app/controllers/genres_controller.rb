class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb :'/genres/index'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    @songs = @genre.songs #this is an array
    @artists = @genre.artists #this is an array
    # binding.pry
    erb :'/genres/show'
  end

end
