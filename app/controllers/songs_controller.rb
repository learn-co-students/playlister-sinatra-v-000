require "rack-flash"
class SongsController < ApplicationController
  use Rack::Flash
  get "/songs" do
    @songs = Song.all
    erb :"songs/index"
  end

  get "/songs/new" do
    @genres = Genre.all
    erb :"songs/new"
  end

  get "/songs/:slug/edit" do
    slug = params[:slug].downcase
    @song = Song.find_by_slug(slug)
    @genres = Genre.all
    erb :"songs/edit"
  end

  get "/songs/:slug" do
    slug = params[:slug].downcase
    @song = Song.find_by_slug(slug)
    erb :"/songs/show"
  end

  post "/songs" do
    s = Song.create(params[:song])
    s.genre_ids = params[:genre][:ids]
    s.artist = Artist.find_or_create_by(params[:artist])
    s.save

    flash[:message] = "Successfully created song."
    redirect :"/songs/#{s.slug}"
  end

  patch "/songs" do
    s = Song.find_by(params[:song])
    s.update(params[:song])
    s.artist = Artist.find_or_create_by(params[:artist])
    s.genre_ids = params[:genre][:ids]
    s.save

    flash[:message] = "Successfully updated song."
    redirect :"/songs/#{s.slug}"
  end
end
