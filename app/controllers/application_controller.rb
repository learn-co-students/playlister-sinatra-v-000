class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions
  use Rack::Flash
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  post '/set-flash' do
    # Set a flash entry
    #flash[:notice] = "Thanks for signing up!"

    # Get a flash entry
    #flash[:notice] # => "Thanks for signing up!"

    # Set a flash entry for only the current request
    #flash.now[:notice] = "Thanks for signing up!"
  end
end
