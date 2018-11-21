class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end


  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'

  end

  post '/songs' do
    @song = Song.new
    @song.name = params[:Name]
    @genres = Genre.find(params[:genres])
    @genres.each do |genre|
    end 
    binding.pry
  end

  get '/songs/:slug' do
      @song = Song.find_by_slug(params[:slug])

      erb :'songs/show'
  end



end
