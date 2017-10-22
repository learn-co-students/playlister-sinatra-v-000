class GenresController < ApplicationController

  get '/genres' do
    @genress = Genre.all
    erb :'/genres/show'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    #binding.pry 
    erb :'/genres/:slug'
  end



end
