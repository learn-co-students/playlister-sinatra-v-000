require 'rack-flash'
class SongsController < ApplicationController
  use Rack::Flash

  get "/songs" do
    @songs = Song.all
    erb :'/songs/index'
  end

  get "/songs/new" do
    @song = Song.new
    erb :'songs/new'
  end

  get "/songs/:slug" do
    @song = Song.find_by_slug(params["slug"])
    erb :'songs/show'
  end

  post "/songs" do
    @song = Song.create(name: params[:song_name])
    @song.artist = Artist.find_or_create_by(name: params[:artist])
    @song.genre_ids = params[:genres]
    @song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get "/songs/:slug/edit" do
    binding.pry
    @song = Song.find_by_slug(params["slug"])
    erb :'songs/edit'
  end

  patch "/songs/:slug/edit" do

  end
end
