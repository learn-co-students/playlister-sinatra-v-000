class GenresController < ApplicationController

  get '/genres' do
    erb :"/genres/index"
  end

  get '/genres/new' do
    erb :"/genres/new"
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])


    erb :"/genres/show"
  end

end
