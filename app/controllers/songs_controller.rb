require 'rack-flash'

class SongsController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end

  post '/songs' do
    song = Song.create({name: params[:name]})
    song.artist = Artist.find_or_create_by(name: params[:artist_name])
    song.genres << params[:genres].collect {|g| Genre.find(g)}
    song.save

    flash[:message] = "Successfully created song."
    redirect to "songs/#{song.slug}"
  end

  get '/songs/:slug' do
    slug = params[:slug]
    @song = Song.find_by_slug(slug)
    erb :"songs/show"
  end

  patch '/songs/:slug' do
    song = Song.find_by_slug(params[:slug])
    song.name = params[:song][:name]

    artist_name = params[:song][:artist]
    if Artist.find_by(:name => artist_name)
      if song.artist.name != artist_name
        song.artist = Artist.find_by(:name => artist_name)
      end
    else
      song.artist = Artist.create(:name => artist_name)
    end

    if song.genres
      song.genres.clear
    end
    genres = params[:song][:genres]
    genres.each do |genre|
      song.genres << Genre.find(genre)
    end

    song.save
    flash[:message] = "Successfully updated song."
    redirect to "songs/#{song.slug}"
  end

  get '/songs/:slug/edit' do
    slug = params[:slug]
    @song = Song.find_by_slug(slug)
    erb :"songs/edit"
  end
end
