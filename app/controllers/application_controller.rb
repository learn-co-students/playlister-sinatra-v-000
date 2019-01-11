require 'sinatra/base'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base

  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  enable :sessions
  # use Sinatra::Flash

  get '/' do
    erb :index
  end
end
