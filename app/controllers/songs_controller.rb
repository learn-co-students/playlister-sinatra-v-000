class SongsController < ApplicationController
  use Rack::Flash
  
  get "/songs" do
    @songs = Song.all
    erb :"songs/index"
  end
  
  get "/songs/new" do
    erb :"songs/new"
  end
  
  post "/songs" do
    song = Song.new(:name => params["Name"])
    if !!song.save
      song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
      song.genre_ids = params["genres"]
      song.save
    else
      redirect "/songs/new"
    end
    flash[:message] = "Successfully created song."
    redirect "/songs/#{song.slug}"
  end
  
  get "/songs/:slug" do
    @song = Song.find_by_slug(params["slug"])
    erb :"songs/show"
  end
  
  get "/songs/:slug/edit" do
    @song = Song.find_by_slug(params["slug"])
    erb :"songs/edit"
  end
  
  patch "/songs/:slug" do
    song = Song.find_by_slug(params["slug"])
    if !!song.update(:name => params["song"]["name"])
      song.artist = Artist.find_or_create_by(:name => params["artist"]["name"])
      song.genre_ids = params["genres"]
      song.save
    else
      redirect "/songs/#{song.slug}/edit"
    end
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{song.slug}"
  end
end
