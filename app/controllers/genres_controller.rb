class GenresController < ApplicationController
  get '/genres' do
    @genres = Genre.all
    erb :'/genres/index'
  end

  get '/genres/:slug' do

  end

  post '/genres' do
    #for creating new songs
  end

  get '/genres/:slug/edit' do

  end

  post '/genres/:slug' do
    #for updating a song
  end
end
