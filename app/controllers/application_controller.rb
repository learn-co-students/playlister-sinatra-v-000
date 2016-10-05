require_relative '../../config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  enable :sessions
  use Rack::Flash
  set :session_secret, "my_application_secret"
  register Sinatra::ActiveRecordExtension
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end
end
