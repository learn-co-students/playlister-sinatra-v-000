class ApplicationController < Sinatra::Base

  register Sinatra::ActiveRecordExtension
  # enable :sessions # I added per flash instructions in lesson
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  # use Rack::Flash

  get '/' do
    erb :index
  end
end
