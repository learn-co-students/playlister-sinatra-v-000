require 'pry'
class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :"/songs/index"
  end

  get '/songs/new' do

    erb :"/songs/new"
  end

  get '/songs/:slug' do
    
    erb :"/songs/show"
  end


  post '/songs' do

    @song = Song.new(:name => params[name])

    @song.genres =

    redirect to("/songs/#{@song.slug}")
  end

end
