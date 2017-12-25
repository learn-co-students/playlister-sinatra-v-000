require 'rack-flash'

class GenresController < ApplicationController
#  use Rack::Flash
  get '/genre' do
    @genre = genre.all
   erb :'/genres/index'
  end
end
