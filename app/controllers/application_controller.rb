require 'sinatra/base'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  enable :sessions
  use Rack::Flash

  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

end
