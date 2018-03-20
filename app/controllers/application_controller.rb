require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  enable :sessions
  enable :method_override
  use Rack::Flash

  get '/' do
    erb :index
  end
end
