require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/redirect_with_flash'


class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  register Sinatra::Flash
  helpers Sinatra::RedirectWithFlash
  enable :sessions


  get '/' do
    erb :index
  end

end
