class SongsController < Sinatra::Base
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/songs' do
    erb :'songs/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  post '/songs' do
    @song = Song.create(name: params[:Name])

    if !params[:NewGenre].empty?
      g = Genre.find_or_create_by(name: params[:NewGenre])
      @song.song_genre_binds.build(genre: g)
    end
    if !params[:Genre].empty?
      params[:Genre].each do |g|
        genre = Genre.find(g.to_i)
        @song.song_genre_binds.build(genre: genre)
      end
    end

    artist = Artist.find_or_create_by(name: params[:ArtistName])
    @song.artist = artist

    @song.save
    erb :"/songs/index", locals: {message: "Successfully created song."}
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/edit'
  end

  patch '/songs/:id' do
    @song = Song.find(params[:id])
    @song.name = params[:Name]
    @song.artist = Artist.find_or_create_by(name: params[:ArtistName])
    Genre.all.each do |genre|
      #if the song has the genre...
      if @song.genres.collect{|g| g.id}.include?(genre.id)
        #...and (no boxes are checked OR) that box was not still checked...
        if params[:Genre].nil? || !params[:Genre].include?(genre.id.to_s)
          #...destory the song_genre_bind
          bind = SongGenreBind.where(song_id: @song.id, genre_id: genre.id)
          @song.song_genre_binds.delete(bind)
        end
      #if the song does NOT have the genre...
      elsif !@song.genres.collect{|g| g.id}.include?(genre.id)
        #...and (skip if no boxes are checked) that box is now checked...
        if !params[:Genre].nil? && params[:Genre].include?(genre.id.to_s)
          #...add the genre.
          @song.song_genre_binds.build(genre: genre)
        end
        #...and the box is not checked, do nothing.
      else
      #something might go wrong though.
        erb :"/songs/index"
      end
    end
    if !params[:NewGenre].empty?
      g = Genre.find_or_create_by(name: params[:NewGenre])
      @song.song_genre_binds.build(genre: g)
    end

    @song.save
    erb :"/songs/show", locals: {message: "Song successfully updated."}
  end
end
