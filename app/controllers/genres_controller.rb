class GenresController < ApplicationController


  get '/genres' do
    @genres = Genre.all
    erb :genres
  end

  get '/genres/:id' do
    @genre = Genre.find_by_id(params[:id])
    erb :show_genre
  end

end
