require 'rack-flash'
class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions do
    set :session_secret, "my_application_secret"
  end
  set :views, Proc.new { File.join(root, "../views/") }
  use Rack::Flash

  get '/' do
    erb :index
  end
end
