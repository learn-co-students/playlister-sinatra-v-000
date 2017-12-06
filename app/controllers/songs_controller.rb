require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash

  # view all songs
  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  # make a new song
  get '/songs/new' do
    @artists = Artist.all
    @genres = Genre.all
    erb :'/songs/new'
  end

  # view certain songs
  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  # process new song and show it
  post '/songs' do
    # convert to downcase before searching to match without consideration of letter case.
    unless params[:artist][:name].empty?
      @artist = Artist.all.find do |a_o|
        a_o.name.downcase == params[:artist][:name].downcase
      end
      @artist ||= Artist.find_or_create_by(params[:artist])
    end

    # if the find didnt assign @artist, find by id. (checkbox)
    @artist ||= Artist.find_or_create_by(id: params[:song][:artist_id])

    # use the name and genre ids from params but the artist from @artist
    @song = Song.create(name: params[:song][:name], genre_ids: params[:song][:genre_ids], artist: @artist)

    # if a genre was manually entered, assign that too.
    unless params[:genre][:name].empty?
      @genre = Genre.all.find do |g_o|
        g_o.name.downcase == params[:genre][:name].downcase
      end
      @genre ||= Genre.find_or_create_by(params[:genre])
      @song.song_genres.build(genre: @genre)
      @song.save
    end

    flash[:message] = 'Successfully created song.'
    redirect "/songs/#{@song.slug}"
  end

# edit the song
  get '/songs/:slug/edit' do
    @artists = Artist.all
    @genres = Genre.all
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    unless params[:artist][:name].empty?
      @artist = Artist.all.find do |a_o|
        a_o.name.downcase == params[:artist][:name].downcase
      end
      @artist ||= Artist.find_or_create_by(params[:artist])
    end

    @artist ||= Artist.find_or_create_by(id: params[:song][:artist_id])

    @song.update(name: params[:song][:name], genre_ids: params[:song][:genre_ids], artist: @artist)

    unless params[:genre][:name].empty?
      @genre = Genre.all.find do |g_o|
        g_o.name.downcase == params[:genre][:name].downcase
      end
      @genre ||= Genre.find_or_create_by(params[:genre])
      @song.song_genres.build(genre: @genre)
      @song.save
    end
    flash[:message] = 'Successfully updated song.'
    redirect "/songs/#{@song.slug}"

  end

end
