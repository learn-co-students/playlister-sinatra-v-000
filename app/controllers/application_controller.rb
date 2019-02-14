require 'sinatra/flash'
class ApplicationController < Sinatra::Base
  enable :sessions
  register Sinatra::Flash
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }


  get '/' do
    erb :index
  end
end
