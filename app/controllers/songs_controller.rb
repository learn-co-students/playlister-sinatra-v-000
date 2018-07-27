
class SongsController < ApplicationController
  use Rack::Flash

  get "/songs" do
=begin
# for testing library parser
    files_array = LibraryParser.parse
    binding.pry
=end
    @songs = Song.all
    erb :"/songs/index"
  end

  get "/songs/new" do
    @genres = Genre.all
    erb :"/songs/new"
  end

  get "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/show"
  end

  post "/songs" do
    @song = Song.find_or_create_by(name: params[:song][:name])
    @song.genre_ids = params[:genres]
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.save
    flash[:message] = "Successfully created song."
    redirect "/songs/#{@song.slug}"
  end

  get "/songs/:slug/edit" do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :"songs/edit"
  end

  patch "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    @song.name = params[:song][:name]
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.genre_ids = params[:genres]
    @song.save
    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end

end
