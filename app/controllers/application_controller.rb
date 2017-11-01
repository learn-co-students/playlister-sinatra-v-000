class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  #
  # include Slug::InstanceMethods
  # extend Slug::ClassMethods

  get '/' do
    erb :index
  end

  get '/songs' do

    erb :show
  end

  get '/songs/new' do

    erb :new
  end

  post '/songs' do

    @song = Song.new(params[:song])
    @song.save

    if !params[:artist][:name].empty?
      @artist = Artist.create(name: params[:artist][:name])
      @artist.songs << @song
    end
    if !params[:genre][:name].empty?
      @genre = Genre.create(name: params[:genre][:name])
      @genre.songs << @song
    end

    redirect to '/songs'
  end

  # {song => {name => "Hello", artist_id => "1", genre_id =>["1, 2"]}
  # artist => {name => "Adele"}
  # genre => {name => "Pop"}
  #
  # {song => {name => "Hello"}
  # artist => {name => "Adele"}
  # genre => {name => "Pop"}}

  get '/songs/:slug' do

    @song = Song.find_by_slug(params[:slug])
    erb :song
  end

  get '/artists' do

    erb :artists
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])

    erb :artist
  end

  get '/genres' do

    erb :genres
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])

    erb :genre
  end
end
