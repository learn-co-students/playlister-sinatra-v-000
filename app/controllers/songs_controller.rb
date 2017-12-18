class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  # get '/songs/new' do
  #   erb :'/songs/new'
  # end

  get '/songs/:slug' do
    words = params[:slug].gsub(/[-]/, " ").split(" ")
    sentence = words.collect do |word|
      word.capitalize
    end
    @song = Song.find_by(name: sentence.join(" "))
    binding.pry
    erb :"/songs/show"
  end

end
