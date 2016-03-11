class GenresController < ApplicationController

  get "/genres" do 
    @genres = Genre.all
    erb :"/genres/index"
  end

  get "/genres/:slug" do 
    @genre = Genre.find_by_slug(params[:slug]) # why is @genre nil in the view?
    erb :"/genres/show"
  end

end