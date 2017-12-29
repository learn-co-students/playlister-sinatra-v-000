require 'pry'
class ArtistController < ApplicationController

  get '/artist' do
    @artist = Artist.all
    erb :'/artists/index'
  end
end
