require 'pry'
class SongController < ApplicationController

  get '/songs' do
    @songs = Song.all
    binding.pry
    erb :'songs/songlist'
  end

end
