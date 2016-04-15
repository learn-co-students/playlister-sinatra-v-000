class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    set :session_secret, "my_application_secret"
  end
  
end
