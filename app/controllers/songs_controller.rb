class SongsController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/songs' do
    @songs = Song.all
    erb :"songs/index"
  end

  get '/songs/new' do
    erb :"songs/new"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    erb :"songs/show"
  end



  post '/songs' do
    @song = Song.new(:name => params["name"])
    @artist = Artist.find_or_create_by(:name => params["artist_name"])
    @song.artist = @artist
    params["genre_ids"].each do |id|
      @song.genres << Genre.find(id)
    end
    @song.save
    flash[:message] = "Successfully created a song."
    redirect "/songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])

    erb :edit
  end

  post '/songs/:slug' do
    "EDITED SONG COMIN AT YA"
  end

end
