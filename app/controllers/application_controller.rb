# require 'sinatra/flash'
require 'rack-flash'

class ApplicationController < Sinatra::Base


  configure do
    enable :sessions
    # register Sinatra::Flash
    use Rack::Flash
    set :session_secret, "secret"
  end
  
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
end