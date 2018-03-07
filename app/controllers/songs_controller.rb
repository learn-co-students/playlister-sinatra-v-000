class SongsController < ApplicationController

  get '/' do
    erb :index
  end

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    #need to turn the slug into an id
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  post '/songs' do
    #not sure if the below is correct
    @artists = Artist.all
    @genres = Genre.all
    @song = Song.create(name: params[:name], artist_id: params[:artist_id])

    if !params[:artist_name].empty?
      @artist = Artist.create(name: params[:artist_name])
      @artist.save
    else
      @artist = Artist.find_by_slug(params[:artist_slug])
    end
    @ = Pet.create(name: params[:pet_name], owner_id: @owner.id)
    @pet.save
    # @genres = params[:genres]
    redirect to "/songs/#{@song.slug}"
  end
end
