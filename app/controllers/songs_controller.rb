class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  post '/songs' do
    @song = Song.create(name: params["Name"])
    if !params[:"Artist Name"].empty?
      @song.artist = Artist.create(:name => params[:"Artist Name"])
    end
    if !params["genres[]"].empty?
      @song.genres << Genre.create(name: params["genres[]"])
      # the line above seems wrong for multiple genres
    end
    @song.save
    binding.pry
    redirect "songs/#{@song.slug}"
  end
  # the instantiations above may not capture all the relevant data

  # post '/owners/:id' do
  #   @owner = Owner.find(params[:id])
  #   @owner.update(params["owner"])
  #   if !params["pet"]["name"].empty?
  #     @owner.pets << Pet.create(name: params["pet"]["name"])
  #   end
  #   redirect "owners/#{@owner.id}"
  # end

  # post '/pets' do
  #   @pet = Pet.create(params[:pet])
  #   if !params["owner"]["name"].empty?
  #     @pet.owner = Owner.create(name: params["owner"]["name"])
  #   end
  #   @pet.save
  #   redirect "pets/#{@pet.id}"
  # end
  # the above is a precedent from a prior lab

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

end
