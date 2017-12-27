require 'rack-flash'
class ArtistsController < ApplicationController
  use Rack::Flash

  get '/artists' do
    @artists=Artist.all
    erb :'/artists/index'
  end

  get '/artists/:slug' do
    #binding.pry
    @artist=Artist.find_by_slug(params[:slug])
    @songs=@artist.songs
    @genres=@artist.genres
    puts params[:slug]
    puts @artist
    erb :'/artists/show'
  end

end
