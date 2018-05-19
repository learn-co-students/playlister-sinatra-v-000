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
    # puts "Params = #{params}"
    @song = Song.create(name: params[:song_name])

    # Find or Create new Artist + associate to Song
    if !Artist.find_by(name: params[:artist_name])
      # puts "create new artist"
      @artist = Artist.create(name: params[:artist_name])
    else
      # puts "find artist"
      @artist = Artist.find_by(name: params[:artist_name])
    end
    @song.artist_id = @artist.id
    # puts "song artist id = #{@song.artist_id} || artist id = #{@artist.id}"

    # # Create new Song_Genre association
    if !params["genres"].empty?
      # puts "update genres"
      SongGenre.all.each do |song_genre|
        # puts "delete genres"
        if song_genre.song_id == @song.id
          song_genre.delete
        end
      end
      params["genres"].each do |new_genre|
        # puts "create genres"
        SongGenre.create(genre_id: new_genre[0], song_id: @song.id)
      end
    end
    # puts "updated"

    @song.save
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song_genres = SongGenre.all
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.update(name: params[:song_name], artist_id: params[:artist_name])
    redirect to "/songs/#{@song.slug}"
  end

  delete '/songs/:slug/delete' do
    @song = Song.find_by_slug(params[:slug])
    @song.delete
    redirect to '/songs'
  end

end

# rspec spec/features/04_basic_view_spec.rb
# rspec spec/features/05_song_form_spec.rb

# learn --f-f << -- only reports the first spec failure
