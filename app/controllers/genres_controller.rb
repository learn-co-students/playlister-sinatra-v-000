class GenresController < ApplicationController

  get '/genres' do
    @genres = Genre.all
    erb :'/genres/index'
  end

  get '/genres/:slug' do
    # Any given genre's show page should have links to that genre's artists and songs.
    erb :'/genres/show'
  end

end