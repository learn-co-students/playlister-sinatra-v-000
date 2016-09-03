require 'pry'
class GenresController < ApplicationController

# genres route controller
  get '/genres' do
    @genres = Genre.all
    erb :'genres/index'
  end

  get '/genres/new' do
    erb :'genres/new'
  end

  get '/genres/:slug' do
    # Artist.find_by_slug(slug)
    redirect "genres/#{@genres.slug}"
  end

end
