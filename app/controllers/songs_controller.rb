class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  # ----- INDEX -----

  get '/songs' do
    erb :'/songs/index'
  end

  # ----- CREATE -----

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do

    artist = Artist.find_by(name: params["Artist Name"])

    if !artist
      artist = Artist.create(name: params["Artist Name"])
    end

    @song = Song.create(name: params["Name"], genre_ids: params["genre_ids"])

    @song.artist = artist
    @song.save

    flash[:message] = "Successfully created song."

    redirect to "songs/#{@song.slug}"
  end

  # ----- READ -----

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  # ----- UPDATE -----
  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    @song.name = params["Name"]

    artist = Artist.find_by(name: params["Artist Name"])

    if !artist
      artist = Artist.create(name: params["Artist Name"])
    end

    @song.artist = artist
    @song.update(genre_ids: params["genre_ids"])
    @song.save

    flash[:message] = "Successfully updated song."
    redirect to "songs/#{@song.slug}"
  end

  post '/owners/:id' do
    owner = Owner.find(params[:id])

    if !params[:owner].has_key?("pet_ids")
      owner.pets.clear
    end

    owner.update(params[:owner])

    if !params[:pet][:name].empty?
      owner.pets.create(params[:pet])
    end

    owner.save
    redirect to "owners/#{owner.id}"
  end

end
