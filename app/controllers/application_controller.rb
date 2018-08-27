class ApplicationController < Sinatra::Base
  enable :sessions
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  use Rack::Flash


  get '/' do
    erb :index
  end

  get '/songs' do
    erb :index
  end

  get '/artists' do
    erb :index
  end

  get '/genres' do
    erb :index
  end

end