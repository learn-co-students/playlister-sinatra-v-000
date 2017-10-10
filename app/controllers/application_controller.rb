require 'rack-flash'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  
  configure do
    enable :sessions
    set :session_secret, "secret"
    use Rack::Flash
  end
  
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end
end