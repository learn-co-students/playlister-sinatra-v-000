class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb :'genres/index'
  end

  get '/genres/:name_slug' do
    @genre = Genre.find_by_slug(params[:name_slug])
    erb :"genres/show"
  end

end
