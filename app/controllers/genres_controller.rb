class GenresController < ApplicationController
  get "/genres" do
    @genres = Genre.all
    erb :"/genres/index"
  end

  get "/genres/:slug" do
    @genre = Genre.create(params[:genre]) #[:plug]
    erb :"/genres/show"
  end
end
