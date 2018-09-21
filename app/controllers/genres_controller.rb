class GenresController < ApplicationController

  get "/genres" do
    @genre = Genre.all
    erb :"genres/index"
  end

  get "/genres/:slug" do

  end

  get "/genres/new" do

  end

end
