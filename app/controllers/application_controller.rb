class ApplicationController < Sinatra::Base
#======================configure=========================
  register Sinatra::ActiveRecordExtension
  use Rack::Flash

  enable :sessions
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end
#=======================helpers==========================  
  def find(slug)
    Song.find_by_slug(slug)
  end
#========================================================
end