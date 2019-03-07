class GenresController < ApplicationController

    get "/genres/new" do

  end
    
  get "/genres/:slug" do
    @genre = Genre.find_by_slug(params[:slug])
    erb :'genres/show'
  end

  get "/genres" do
    @genres = Genre.all
    erb :"genres/index"
  end

end