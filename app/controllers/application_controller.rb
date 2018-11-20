require 'sinatra/base'
# require 'sinatra/flash'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  # register Sinatra::Flash


  get '/' do
    erb :index
  end

end
