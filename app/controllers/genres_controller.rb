class GenresController < ApplicationController

  get "/genres/:slug" do

  end

  get "/genres/new" do

  end

  get "/genres" do
    @genre = Genre.all
    erb :"genres/index"
  end

end
