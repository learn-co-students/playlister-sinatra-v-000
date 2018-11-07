class GenresController < ApplicationController

  get '/generes' do
    @songs = Song.all
    erb :'/views/song.rb'
  end
end
