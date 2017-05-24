class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb :'/genres/index'
  end

  get '/genres/:slug' do
    @genre = Genre.all.find {|instance| instance.slug == params[:slug]}
    erb :'/genres/show'
  end
end
