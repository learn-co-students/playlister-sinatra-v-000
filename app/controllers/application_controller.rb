# require 'sinatra/flash'
require 'rack-flash'

class ApplicationController < Sinatra::Base


  configure do
    enable :sessions
  end
  
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
end