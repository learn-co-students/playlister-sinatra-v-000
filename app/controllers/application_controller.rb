require_relative '../../lib/library_parser.rb'
class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

    
    
  get '/' do
    erb :index
  end
end