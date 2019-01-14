class SongsController < ApplicationController

  get "/songs" do
    @songs = Song.all

    erb :"/songs/index"
  end

  get "/songs/new" do
    @genres = Genre.all

    erb :"/songs/new"
  end

  post "/songs" do
    song = Song.create(name: params["Name"])

    artist = Artist.find_or_create_by(name: params["Artist Name"])

    song.artist = artist

    song.genre_ids = params[:genres]

    song.save

    flash[:message] = "Successfully created song."

    redirect "/songs/#{song.slug}"
  end

  get "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])

    erb :"/songs/show"
  end

  get "/songs/:slug/edit" do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all

    erb :"/songs/edit"
  end

  patch "/songs/:slug" do
    song = Song.find_by_slug(params[:slug])

    if params["Name"] != song.name
      song.update(name: params["Name"])
    end

    if params["Artist Name"] != song.artist.name
      artist = Artist.find_or_create_by(name: params["Artist Name"])
      song.update(artist: artist)
    end

    song.update(genre_ids: params[:genres])

    flash[:message] = "Successfully updated song."

    redirect "/songs/#{song.slug}"
  end
end
