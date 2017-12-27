require 'rack-flash'
class GenresController < ApplicationController
  use Rack::Flash

  get '/genres' do
    @genres=Genre.all
    erb :'/genres/index'
  end

  get '/genres/:slug' do
    #binding.pry
    @genre=Genre.find_by_slug(params[:slug])
    @songs=@genre.songs
    @artists=@genre.artists
    erb :'/genres/show'
  end


end
