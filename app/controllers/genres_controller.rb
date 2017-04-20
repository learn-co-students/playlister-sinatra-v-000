class GenresController < ApplicationController
  get "/genres" do
    # instance variables
    @genres = Genre.all

    # view
    erb :'/genres/index'
  end

  get '/genres/:slug' do
    # instance variables
    @genre = Genre.find_by_slug(params[:slug])
    @songs = @genre.songs
    @artists = @genre.artists

    # view
    erb :'/genres/show'
  end
end
