class GenresController < ApplicationController
  get '/genres' do
    @genres = Genre.all
    erb :'/genres/index'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    
    @songgenres = SongGenre.all.find_by_id(@genre.id)
    erb :'/genres/show'
  end


end
