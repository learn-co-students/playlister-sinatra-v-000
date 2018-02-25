class SongsController < ApplicationController
<<<<<<< HEAD

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  # get 'songs/new' do
  #   erb :'/songs/new'
  # end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

=======
  # include Slugifiable

  get '/songs' do
    @songs = Song.all
    erb :"/songs/index"
  end

  get '/songs/new' do
    erb :"/songs/new"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    erb :"songs/show"
  end


>>>>>>> 1f9fad4566e7bea66933d1080285aea037651e86
end
