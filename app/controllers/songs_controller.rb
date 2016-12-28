class SongsController < Sinatra::Base

  configure do
    set :views, "app/views/songs"
    enable :sessions
    use Rack::Flash
  end

  get "/songs" do
    @songs = Song.all
    erb :index
  end

  get "/songs/new" do
    @genres = Genre.all
    erb :new
  end

  post "/songs" do
    artist = Artist.find_or_create_by(name: params[:song][:artist][:name])
    song = artist.songs.find_or_create_by(name: params[:song][:name])
    song.update(genre_ids: params[:song][:genre_ids])
    flash[:message] = "Successfully created song."
    redirect to("/songs/#{song.slug}")
  end

  get "/songs/:slug/edit" do
    @song = Song.find_by_slug(params[:slug])
    @genres = Genre.all
    erb :edit
  end

  get "/songs/:slug" do
    @song = Song.find_by_slug(params[:slug])
    erb :show
  end

  post "/songs/:slug" do
    song = Song.find_by_slug(params[:slug])
    artist = song.artists.find_or_create_by(name: params[:song][:artist][:name])
    song.update(
      name: params[:song][:name],
      genre_ids: params[:song][:genre_ids]
    )
    flash[:message] = "Successfully updated song."
    redirect to("/songs/#{song.slug}")
  end

end
