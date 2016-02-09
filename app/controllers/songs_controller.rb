class SongsController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/songs") }

  get '/songs' do
    @songs = Song.all
    erb :index
  end

  get '/songs/new' do
    erb :new
  end

  post '/songs' do
  #code to create a new song and save to DB
  song = Song.find_or_create_by_name("params[:song_name]")
  song.artist = Artist.find_or_create_by_name("params[:artist_name]")
  song.genres = params[:genres]
  erb :'songs/show', locals: {message: "Successfully created song."}
end

get '/songs/:slug' do
  @song = Song.find_by_slug(params[:slug])
  #binding.pry
  erb :show
end

patch '/songs/:slug' do
  song = Song.find_by_slug(params[:slug])
  song.name = params[:song_name]
  song.artist = Artist.find_or_create_by_name("params[:artist_name]")
  song.genres = params[:genres]

  redirect to "/songs/#{song.slug}"
end

get '/songs/:slug/edit' do
  @song = Song.find_by_slug(params[:slug])
  erb :edit
end
end
