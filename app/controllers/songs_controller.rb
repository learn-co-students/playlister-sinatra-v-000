require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash

  get "/songs" do
    erb :"songs/index"
  end

  get "/songs/new" do
    erb :"songs/new"
  end

  post "/songs" do
    @song = Song.create(name: params[:name])
    @song.artist = Artist.find_or_create_by(name: params[:artist_name])
    @song.genre_ids = params[:genres]
    @song.save
    flash[:message] = "Successfully created song."
    redirect to("/songs/#{@song.slug}")
  end

  get "/songs/:slug" do
    erb :"songs/show"
  end

  get "/songs/:slug/edit" do
    erb :"songs/edit"
  end

  patch "/songs/:slug" do
    current_song.update(params[:song])
    current_song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    current_song.genre_ids = params[:genres]
    current_song.save

    flash[:message] = "Successfully updated song."
    redirect("/songs/#{current_song.slug}")
  end
end
