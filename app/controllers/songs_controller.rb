class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'/songs/new'
  end

  post '/songs' do
    puts "Params = #{params}"
    @song = Song.create(name: params[:song_name])

    if !Artist.find_by(name: params[:artist_name])
      @artist = Artist.create(name: params[:artist_name])
    else
      @artist = Artist.find_by(name: params[:artist_name])
    end
    @song.artist_id = @artist.id

    if !params["genres"].empty?
      SongGenre.create(genre_id: params["genres"], song_id: @song.id)
    end

    @song.save
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song_genres = SongGenre.all
    erb :'/songs/show'
  end

end

# rspec spec/features/04_basic_view_spec.rb
# rspec spec/features/05_song_form_spec.rb

# learn --f-f << -- only reports the first spec failure
