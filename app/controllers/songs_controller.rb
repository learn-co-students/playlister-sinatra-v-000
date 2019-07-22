require 'sinatra/base'
require 'rack-flash'
class SongsController < ApplicationController
  
  enable :sessions
  use Rack::Flash
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  
  get '/songs' do 
    @songs = Songs.all
    erb :'songs/index'
  end 
end