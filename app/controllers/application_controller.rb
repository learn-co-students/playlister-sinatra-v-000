class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params["slug"])
    if @song != params["slug"]
      @song.update(name: params["Name"])
    end

    @artist = Artist.find_by_id(@song.artist_id)
    if @artist.name != params["Artist Name"]
      @artist.update(name: params["Artist Name"])
    end

    @genre = SongGenre.find_by_id(@song.id)
    if @genre.genre_id != params["genres"][0]
      @genre.update(genre_id: params["genres"][0])
    end

    flash[:message] = "Successfully updated song."

    redirect to "/songs/#{@song.slug}"
  end
  
end