class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  enable :sessions
  set :session_secret, "my_application_secret"
  set :views, "app/views"

  get '/' do
    erb :index
  end
end
