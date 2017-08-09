class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  get '/artists' do
    erb :'/artists/index'
  end

  get '/genres' do
    erb :'/genres/index'
  end
end
