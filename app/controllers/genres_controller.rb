class GenresController < ApplicationController

  get '/genres' do
    erb :'/genres/index'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    @my_songs = @genre.songs
    erb :'/genres/show'
  end

end
