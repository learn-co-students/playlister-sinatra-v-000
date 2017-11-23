require 'rack-flash'
class SongsController < ApplicationController

  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @artists = Artist.all
    erb :'/songs/new'
  end


  post '/songs' do
   @song = Song.create(name: params["name"])
   @artist_name = Artist.find_by(name: params["artist_name"])
    if @artist_name == nil
      @song.artist = Artist.create(name: params["artist_name"])
    else
      @song.artist = @artist_name
    end
   @genre_name = Genre.find(params["genres"])
   @song.genres << @genre_name
   @song.save
   flash[:notice] # => "Successfully created song."
    redirect to "songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end



end
