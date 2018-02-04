class SongControllers < ApplicationController

  get '/songs' do
    erb :'songs/view_all'
  end


get '/songs/new' do
  erb :'songs/create'
end

post '/songs/create' do
  song_name = params["Name"]
  song_genres =params["genres"]
  artist = Artist.find_by(name: params["Artist Name"])
  if artist.nil? && !params["Artist Name"].empty?
    artist = Artist.new(name: params["Artist Name"])
  elsif params["Artist Name"].empty?
    artist = Artist.find_by(name: "Artist not Found")
  end
  new_song = Song.create(name: song_name, artist: artist)
  new_song.genre_ids = new_song.genre_ids.concat(song_genres)
  flash[:message] = "Successfully created song."
  redirect "/songs/#{new_song.slug}"
end

get '/songs/:slug' do
  @song = Song.find_by_slug(params[:slug])
  erb :'/songs/view'
end

get '/songs/:slug/edit' do
  @song = Song.find_by_slug(params[:slug])

    flash[:message] ="Successfully updated song."
  erb :'/songs/edit'
end

post '/songs/:slug' do
  song_name = params["Name"]
  song_genres =params["genres"]
  artist = Artist.find_by(name: params["Artist Name"])
  if artist.nil?
    artist = Artist.new(name: params["Artist Name"])
  end
  song = Song.find_by(name: song_name)
  song.artist = artist
  song.genre_ids = song_genres
  song.save
  redirect "/songs/#{song.slug}"
end
end
