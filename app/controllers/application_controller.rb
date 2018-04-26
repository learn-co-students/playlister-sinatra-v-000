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

  get '/songs/:slug' do
    @song = Song.find_by_slug(params [:slug] )
    @song.slug = params[:slug]
    erb :show
  end

  get '/artists' do
    @artists = Artist.all
    # binding.pry
    erb :'/artists/index'
  end


  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params [:slug] )
    @artist.slug = params[:slug]
    erb :show
  end

    get '/genres' do
      @genres = Genre.all
      # binding.pry
      erb :'/genres/index'
    end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug] )

    @genre.slug = params[:slug]

    erb :show
  end


end
