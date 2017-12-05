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
    # find based on text box




# convert to downcase before searching to match without consideration of letter case.
    unless params[:artist][:name].empty?
      @artist = Artist.all.find do |a_o|
        a_o.name.downcase == params[:artist][:name].downcase
      end
    end

    @artist ||= Artist.find_or_create_by(id: params[:song][:artist_id])

    # use the name and genre ids from params but the artist from @artist
    @song = Song.create(name: params[:song][:name], genre_ids: params[:song][:genre_ids], artist: @artist)

    unless params[:genre][:name].empty?
      genre = Genre.find_or_create_by(params[:genre])
      @song.song_genres.build(genre: genre)
      @song.save
    end

    flash[:message] = 'Successfully created song.'

    redirect "/songs/#{@song.slug}"
  end
end
