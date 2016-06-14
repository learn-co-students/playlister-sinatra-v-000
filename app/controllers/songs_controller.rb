class SongsController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/songs/") }

  get '/songs' do
    @songs = Song.all
    erb :index
  end

  get '/songs/new' do 
    @genres = Genre.all 
    erb :new
  end

  get '/songs/:slug' do 
    @song = Song.find_by_slug(params["slug"])
    erb :show
  end

  post '/songs' do 
    @song = Song.create(:name => params["song_name"])
    @song.artist = Artist.find_or_create_by(:name => params["artist_name"])
    @song.genre_ids = params["genre.id"]
    @song.save

    redirect("/songs/#{@song.slug}")
  end

end