class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'song/index'
  end

  get '/songs/new' do
    erb :'song/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'song/show'
  end

  post '/songs' do
    @artist = Artist.find_or_create_by(name: params[:song][:artist])
    @artist.songs.build(name: params[:song][:name])
    @artist.save
    last_song = @artist.songs.last

    if !params[:genres][:id].empty?
      params[:genres][:id].each do |id|
        last_song.song_genres.build(song_id: last_song.id, genre_id: id)
        last_song.save
      end
    end

    flash[:message] = "Successfully created song."
    redirect to "songs/#{last_song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'song/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_id(params[:song][:id])
    @song.update(name: params[:song][:name])
    @song.artist = Artist.find_or_create_by(name: params[:song][:artist])
    @song.genre_ids = params[:genres]
    # binding.pry
    @song.save

    flash[:message] = "Successfully updated song."
    redirect to "/songs/#{@song.slug}"
  end

end
