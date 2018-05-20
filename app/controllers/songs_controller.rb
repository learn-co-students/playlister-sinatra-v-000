class SongController < ApplicationController

  get '/songs' do
  @songs = Song.all
  binding.pry
  erb :'/songs/index'
end

get '/songs/new' do
  @artists = Artist.all
  @genres = Genre.all

  erb :"/songs/new"
end


post '/songs' do

  @song = Song.create(name: params["Name"])


    if params["artist_name"]
      @song.artist = Artist.find_or_create_by(name: params["artist_name"])
    if params["genres"]
      @song.genre_ids = params["genres"]
          @song.save
    end
  end

     redirect "songs/#{@song.slug}"
  end



get '/songs/:slug' do
  @song = Song.find_by_slug(params[:slug])

  erb :'/songs/show'
end




end
