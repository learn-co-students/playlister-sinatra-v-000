require 'sinatra/base'
require 'rack-flash'
require "rack/flash/test"

class ApplicationController < Sinatra::Base
  enable :sessions
  use Rack::Flash
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }


  get '/' do
  	puts "Playlister"
    erb :index
  end
end