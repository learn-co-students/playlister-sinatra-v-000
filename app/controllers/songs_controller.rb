require 'rack-flash'

class SongsController < ApplicationController
  enable :sessions
  use Rack::Flash

  get '/songs' do
    # This should present the user with a list of all songs in the library.
    # Each song should be a clickable link to that particular song's show page.
    @songs = Song.all
    # binding.pry
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
    # binding.pry
    s = Song.create(name: params["song_name"])
    a = Artist.find_or_create_by(name: params["artist_name"])
    s.artist_id = a.id
    s.save

    params[:genres].each do |g|
      sg = SongGenre.create(song_id: s.id, genre_id: g.to_i)
    end

    flash[:message] = "Successfully created song."
    redirect "/songs/#{s.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @artist = @song.artist
    @genres = Genre.all
    erb :'/songs/edit'
  end

  get '/songs/:slug' do
    # Any given song's show page should have links to that song's artist and the each genre associated with the song.
    # Pay attention to the order of /songs/new and /songs/:slug. The route /songs/new could interpret new as a slug if that controller action isn't defined first.
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find_by_id(@song.artist_id)
    song_genres = SongGenre.find_by(song_id: @song.id)
    @genre = Genre.find_by_id(song_genres.genre_id)


    # binding.pry
    erb :'songs/show'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find_by_id(@song.artist_id)

    if params[:artist][:name] != @artist.name
      @song.artist = Artist.find_or_create_by(name: params[:artist][:name])
      @song.save
    end

    flash[:message] = "Successfully updated song."
    redirect "/songs/#{@song.slug}"
  end



end
