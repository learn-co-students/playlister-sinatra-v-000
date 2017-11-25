require 'rack-flash'
class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @song = Song.new
    erb :'/songs/new'
  end

  post '/songs' do
    #binding.pry
    @song = Song.create(params[:song])

    @artist = Artist.find_by name: params[:artist][:name]

    if !!@artist
      @song.artist = @artist
    else
      @artist = Artist.create(params[:artist])
      @song.artist = @artist
    end
    # add each genre to song.genres
    @song.save

    flash[:message] = "Successfully created song."
    redirect to "songs/#{@song.slug}"
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.name = params["Song Name"] unless params["Song Name"].empty?
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"]) unless params["Artist Name"].empty?
    @song.song_genres = []
    params["genres"].each do |genre|
      @song.song_genres << SongGenre.find_or_create_by(genre: Genre.find(genre.to_i))
    end
    @song.save
    flash[:message] = "Successfully updated song."
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

end
