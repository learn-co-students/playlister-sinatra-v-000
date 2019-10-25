class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  enable :sessions
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

<<<<<<< HEAD
=======
  get '/' do
    erb :index
  end
>>>>>>> b123f08165755515740301254fd27cd597d2a0d7
end
