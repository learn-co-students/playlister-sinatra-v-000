class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  require 'sinatra/flash'
  enable :sessions
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }


  get '/' do
    erb :index
  end
end
