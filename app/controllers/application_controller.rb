class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  get '/songs' do
    redirect '/song_controller'
  end

  get '/artists' do
    redirect '/artist_controller'
  end

  get '/genres' do
    redirect '/genre_controller'
  end
end