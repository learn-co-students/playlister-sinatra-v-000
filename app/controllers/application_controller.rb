class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/songs' do
    @songs = Song.all
    erb :'/songs/index'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(slug)
    erb :'/songs/show'
  end

  get '/artists' do
    @artists = Artist.all
    erb :'/artists/index'
  end

  get '/genres' do
    @genres = Genre.all
    erb :'/genres/index'
  end

end
