class SongsController < ApplicationController
  include Slugifiable

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :"/songs/show"
  end

  post '/songs' do
    binding.pry
  @song = Song.create(name: params["name"])
  # if !params["pet"]["name"].empty?
  #   @owner.pets << Pet.create(name: params["pet"]["name"])
  # end
  # @owner.save
  redirect to "/songs/#{@song.slug}"
end

end
