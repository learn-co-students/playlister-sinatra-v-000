class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  
  enable :sessions # needed for rack-flash3
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end
end