class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb :'genres/index'
  end

  get '/genres/:slug' do
    @slug = Genre.find_by_slug(params[:slug].gsub("-"," "))
    erb :'genres/show'
  end


end
