class SongsController < ApplicationController
  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs' do
    @pet = Pet.create(params[:pet])
    if params["name"].empty?
      @owner = Owner.find(params[:owner])
      @owner.pets << @pet
    else
      @owner = Owner.create(:name => params[:name])
      @owner.pets << @pet
    end
      redirect to "pets/#{@pet.id}"
  end
end
