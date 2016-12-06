class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb :'/genres/index'
  end

  get '/genres/:slug' do
    @genres = Artist.find_by_slug(params[:slug])[0]
    erb :'genres/show'
  end

end
