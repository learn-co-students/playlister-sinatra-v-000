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

    puts "BEFORE @song.song_genres = #{@song.song_genres.count}"
    # Create new Song_Genre association
    if !params["genres"].empty?
      # params["genres"].each do |genre|
      #   puts "create new song_genre #{genre}"
      #   SongGenre.create(genre_id: params["genres"], song_id: @song.id)
        @song.song_genres << SongGenre.create(genre_id: params["genres"], song_id: @song.id)
      # end
    end

    puts "AFTER @song.song_genres = #{@song.song_genres.count}"
    @song.song_genres.each do |song_genre|
      puts "song_genre = #{song_genre} || G #{song_genre.genre_id} || S #{song_genre.song_id}"
    end

    binding.pry
    # puts "SongGenre.all = #{SongGenre.all.count} || Genre : #{SongGenre.all.first.genre_id} | #{SongGenre.all.first.genre.name} || Song : #{SongGenre.all.first.song_id} "
    # SongGenre.all.each do |song_genre|
    #   puts "genre = #{song_genre.genre.name} || #{song_genre.genre.id}"
    #   if song_genre.song_id == @song.id
    #     puts "song has genre : #{song_genre.genre.name}"
    #   end
    # end

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
