# require 'sinatra/base'
# require 'sinatra/flash'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  register Sinatra::Flash

  
  enable :sessions
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  

  get '/' do
    erb :index
  end
end