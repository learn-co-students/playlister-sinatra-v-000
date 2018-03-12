class ApplicationController < Sinatra::Base
  require 'rack-flash'
  require 'sinatra/flash'
  register Sinatra::Flash
  register Sinatra::ActiveRecordExtension
  enable :sessions    
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  use Rack::Flash

  get '/' do
    erb :index
  end
end