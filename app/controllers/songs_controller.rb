class SongsController < ApplicationController

  get "/songs" do
    erb :'songs/index'
  end

  get "/songs/new" do
    erb :"songs/new"
  end

  post "/songs" do
    new_song = Song.create(params[:song])
    artist = Artist.find_or_create_by(params[:artist])
    artist.songs << new_song
    flash[:message] = "Successfully created song."
    redirect "songs/#{new_song.slug}"
  end

  get "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/show"
  end

  get "/songs/:slug/edit" do
    @song = Song.find_by_slug(params[:slug])
    erb :"songs/edit"
  end

  patch "/songs/:slug" do
    song = Song.find_by_slug(params[:slug])
    Song.update(song.id, params[:song])
    if song.artist.name != params[:artist][:name]
      Artist.songs.delete(song.id)
      artist = Artist.find_or_create_by(params[:artist])
      artist.songs << new_song
    end
    flash[:message] = "Successfully updated song."
    redirect "songs/#{song.slug}"
  end

end
