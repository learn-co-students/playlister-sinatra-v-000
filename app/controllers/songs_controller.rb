require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash

  get "/songs" do
    @songs = Song.all
    erb :"songs/index"
  end

  get "/songs/new" do
    erb :"songs/new"
  end

  get "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/show"
  end

  get "/songs/failure" do
    erb :"songs/failure"
  end

  post "/songs" do
    @song = Song.create(name: params["Name"])
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.genre_ids = params[:genres]
    @song.save

    flash[:message] = "Successfully created song."

    redirect "songs/#{@song.slug}"
  end

  post "/songs" do
    artist_name = params[:artist_name]
    song_name = params[:song_name]

    if artist_name.empty? || song_name.empty?
      redirect "/songs/failure"
    else
      #binding.pry
      artist = Artist.find_by(name: artist_name)
      song = Song.find_by(name: params[:song_name])
      if artist.nil?
        @new_artist = Artist.create(name: params[:artist_name])
        @new_song = Song.create(name: params[:song_name])
        @new_song.artist = @new_artist.name
        @new_artist.songs << @new_song
        @new_artist.save
        @new_song.save
      else
        song = Song.find_by(name: params[:song_name])
        if song.nil?
          @new_song = Song.create(name: params[:song_name])
          @new_song.artist = artist
          @new_song.save
        end
      end
    end

    redirect "songs/#{@new_song.slug}"
  end

  get "/songs/:slug/edit" do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/edit"
  end

  patch "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    @song.update(params[:song])
    @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
    @song.genre_ids = params[:genres]
    @song.save

    flash[:message] = "Successfully updated song."
    redirect "songs/#{@song.slug}"
  end

  get "/songs/failure" do
    erb :"songs/failure"
  end

end # CLASS
