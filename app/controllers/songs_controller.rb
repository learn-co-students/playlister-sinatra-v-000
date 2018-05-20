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

    if params["Artist Name"]
      @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    if params["genres"]
      @song.genre_ids = params["genres"]
          @song.save
    end
  end
binding.pry
     redirect "songs/#{@song.slug}"
  end



get '/songs/:slug' do
  @song = Song.find_by_slug(params[:slug])

  erb :'/songs/show'
end




end
