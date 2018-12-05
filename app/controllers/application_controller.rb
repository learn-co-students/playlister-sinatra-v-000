class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  require 'sinatra/base'
  require 'rack-flash'

  enable :sessions
  use Rack::Flash

  get '/' do
    erb :index
  end
<<<<<<< HEAD

=======
  
>>>>>>> e415e7cd986e05b5834fbcc02fa42d725277e25e
end
