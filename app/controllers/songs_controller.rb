class SongsController < ApplicationController

  get '/songs' do
    @songs = Song.all
    erb:'songs/index'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    if @song
      @artist = Artist.find(@song.artist_id)
      @song_genre = SongGenre.find_by song_id: @song.id
      genre_id = @song_genre.genre_id
      @genre = Genre.find(genre_id)
      erb:'songs/show'
    else
      redirect '/songs'
    end
  end
end

post '/signup' do
  @user = User.new(username: params["username"], email: params["email"], password: params["password"])
  if !!@user.username && !!@user.email && !!@user.password && @user.username != "" && @user.email != "" && @user.password != ""
    @user.save
    session[:user_id] = @user.id
    redirect '/tweets'
  else
    redirect '/signup'
  end
end
