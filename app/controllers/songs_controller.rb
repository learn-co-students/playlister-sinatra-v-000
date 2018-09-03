require 'sinatra/base'
require 'rack-flash'

class SongsController < Sinatra::Base
  enable :sessions
  use Rack::Flash
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/songs' do
    @songs = Songs.all

    erb :"songs/index"
  end

  post '/songs' do
    @songs = Song.create(params)
    flash[:message] = "Successfully created song."

    redirect to ("/songs/#{@song.slug}")
  end






end
