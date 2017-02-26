class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  post '/songs' do
    raise params.inspect
  end

  get '/artists' do
    @artists = Artist.all
    erb :'artists/index'
  end

  get '/genres' do
    @genres = Genre.all
    erb :'genres/index'
  end

  get '/songs/new' do
    erb :'songs/new'
  end

  get '/artists' do
    @artists = Artist.all
    erb :'artists/index'
  end

  get '/genres' do
    @genres = Genre.all
    erb :'genres/index'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :'songs/show'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'artists/show'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :'genres/show'
  end

helpers Slugifiable

end
