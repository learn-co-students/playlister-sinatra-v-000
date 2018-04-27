class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
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
    erb :'/songs/new'
  end





  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug] )
    # @song.slug = params[:slug]
    erb :'/songs/show'
  end

  get '/artists' do
    @artists = Artist.all
    # binding.pry
    erb :'/artists/index'
  end


  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug] )
    # @artist.slug = params[:slug]
    erb :'/artists/show'
  end

    get '/genres' do
      @genres = Genre.all
      # binding.pry
      erb :'/genres/index'
    end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug] )
    # @genre.slug = params[:slug]
    erb :'/genres/show'
  end

   post '/songs' do
    #  raise params.inspect

    @artist = Artist.find_or_create_by(:name => params["artist_name"])
      @song = Song.create(:name => params["song_name"], :artist_id => @artist.id)
    # @song.artist = Artist.find_or_create_by(:name => params[:song]["Artist Name"])
    @song.genre_ids = params[:genres]
    @song.save
      # binding.pry
      # raise params.inspect
       erb :"/songs/show"
    end

    # raise params.inspect
  end
#
