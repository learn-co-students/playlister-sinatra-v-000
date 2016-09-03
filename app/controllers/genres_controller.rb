require 'pry'
class GenresController < ApplicationController

# genres route controller
  get '/genres' do
    @songs = Song.all
    erb :'genres/index'
  end

  get '/genres/new' do
    erb :'genres/new'
  end

end
