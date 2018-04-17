class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  configure do
    enable :sessions
    set :session_secret, "my_application_secret"
  end

  set :views, Proc.new { File.join(root, "../views/") }


  get '/' do
    erb :index
  end
end
