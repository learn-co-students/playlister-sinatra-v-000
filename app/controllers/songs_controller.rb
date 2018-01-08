require 'rack-flash'

class SongsController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  enable :sessions
  use Rack::Flash

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    erb :'songs/new'
  end

  post '/songs' do
    @song = Song.create(name: params[:song][:name])
    if Artist.all.find_by(name: params[:artist][:name])
      @artist = Artist.all.find_by(name: params[:artist][:name])
    else
      @artist = Artist.create(name: params[:artist][:name])
    end
    @genre = Genre.all.find_by(name: params[:genre][:name])
    @song.artist_id = @artist.id
    @song.genre_ids = @genre.id
    @song.save
    flash[:message] = "Successfully created song."
    redirect to "songs/#{@song.slug}"
  end

  get '/songs/:slug/edit' do
    @song = Song.all.find { |song| song.slug == params[:slug] }
    @artist = @song.artist
    @genre = Genre.all.find_by(id: @song.genre_ids[0])
    @genres = Genre.all
    erb :'songs/edit'
  end

  patch '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    @song.artist.update(params[:artist])
    @song.genre_ids.update(params[:genre])
    flash[:message] = "Successfully updated song."
    redirect to "songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.all.find { |song| song.slug == params[:slug] }
    @artist = Artist.all.find_by(id: @song.artist_id)
    @genre = Genre.all.find_by(id: @song.genre_ids[0])
    erb :'songs/show'
  end
end
