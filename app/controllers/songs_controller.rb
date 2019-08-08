require 'rack-flash'
class SongsController < ApplicationController

  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs' do
    artist_match = Artist.find {|artist|
      artist.name == params["Artist Name"]}
    if artist_match == nil
      @artist = Artist.create(:name => params["Artist Name"])
    else
      @artist = artist_match
    end
    @song = Song.create(:name => params[:Name],
    :artist => @artist)
    flash[:message] = "Successfully created song."
    params[:genres].each do |genre_id|
        @song.genres << Genre.find(genre_id)
        @song.save
    end
    redirect to "/songs/#{@song.slug}"
end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
      erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.name = params[:Name]
    @song.artist = params["Artist Name"]
    @song.genres = params[:genres]
    @song.save
     erb :'/songs/show'
  end

end
