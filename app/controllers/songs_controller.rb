class SongController < ApplicationController

  get '/songs' do
  @songs = Song.all
  erb :'/songs/index'
end

get 'songs/new' do
  @artist=Artist.all
  @genre = Genre.all
  erb :"/songs/new"
end

post '/songs' do
  @song = Song.create(params[:song])
    if !params["artist"]["name"].empty?
      @song.artist = Artist.create(name: params[:artist][:name])
      @song.save
    end

    redirect to "songs/#{@song.slug}"
  end


get '/songs/:slug' do
  @songs = Song.find_by_slug(params[:slug])
  # binding.pry
  erb :'/songs/show'
end



end
