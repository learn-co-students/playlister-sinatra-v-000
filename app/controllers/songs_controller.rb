class SongsController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/songs' do
    erb :'/songs/index'
  end

  post '/songs' do
    song = Song.create(name: params["Name"])
    song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    #binding.pry
    song.genres << Genre.find_by_id(id: params["Genre"])
    song.genres.save
    song.artist.save
    redirects to '/songs'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/show'
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    erb :'/songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    session[:message] = "Song successfully updated."
    #  binding.pry
    if params["Artist Name"].present?
      @song.update(artist_id: Artist.find_or_create_by(name: params["Artist Name"]).id)
    end
    @song.update(genre_ids: params[:Genre])
    #  binding.pry
    @song.save
    redirect "/songs/#{@song.slug}"
  end

end
