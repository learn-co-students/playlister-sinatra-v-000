class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  
  enable :sessions
  #use Rack::Flash

  
  get "/message" do
    # flash[:message] = "Successfully created song."
    # redirect to("/songs")
  end
  

end