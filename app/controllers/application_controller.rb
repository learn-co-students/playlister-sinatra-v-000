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

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    erb :song
  end

  get '/artists' do

    erb :artists
  end

  get '/artists/:slug' do
    @artist = Aritst.find_by_slug(params[:slug])

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
