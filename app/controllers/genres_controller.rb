class GenresController < ApplicationController
  get "/genres" do
    erb :"genres/index"
  end

  get "/genres/new" do

  end

  get "/genres/:slug" do
    erb :"genres/show"
  end
end
