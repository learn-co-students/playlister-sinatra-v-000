class SongsController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/") }

  use Rack::Flash
  enable :sessions

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
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

  post '/songs' do
    song = Song.create(name: params[:name])

    artist = Artist.find_or_create_by(name: params[:artist])
    song.artist = artist

    params[:genre].each do |genre|
      song.genres << Genre.find(genre)
    end

    song.save

    flash[:message] = "Successfully created song."

    redirect to "/songs/#{song.slug}"
  end

  patch '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])

    artist = Artist.find_or_create_by(name: params[:artist])
    song.artist = artist

    song.genres.clear
    params[:genre].each do |genre|
      song.genres << Genre.find(genre)
    end

    song.save

    flash[:message] = "Successfully updated song."

    redirect to "/songs/#{song.slug}"
  end
end
