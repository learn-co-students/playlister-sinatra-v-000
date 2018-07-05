require "./config/environment"
# require "./models/artist"
# require "./models/song"
# require "./models/genre"
# require_relative "models/concerns/slugify"
require 'sinatra/base'
require 'rack-flash'


class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  enable :sessions
  use Rack::Flash
end