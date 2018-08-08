require 'rack-flash'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  use Rack::Flash
  enable :sessions
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/new' do
    @genres = Genre.all
    #binding.pry
    erb :'/songs/new'
  end

  post '/songs' do
    #binding.pry
    @song = Song.create(name: params["Name"])
    #@song.save
    @song.artist = Artist.find_or_create_by(name: params["Artist Name"])
    @song.genre_ids = params[:genres]
    #@gen = params["genres"]
    #@gen.each do |gen|
    #  @sg = SongGenre.create(song_id: @song.id, genre_id: gen)
  #    @sg.save
  #  end
  #  @song.save

    #if !params["Artist Name"].blank?
  #  @artist = Artist.find_or_create_by(name: params["Artist Name"])
    #@artist.songs << @song
    #end
    @song.save
    #binding.pry
    flash[:message] = "Successfully created song."
    redirect to "/songs/#{@song.slug}"
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    #binding.pry
    erb :'/songs/show'
  end




  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    #binding.pry
    erb :'/artists/show'
  end

  get '/genres' do
    @genres = Genre.all
    erb :'/genres/index'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    #binding.pry
    erb :'/genres/show'
  end

end
