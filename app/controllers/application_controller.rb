class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  register Sinatra::Flash

  configure do
    enable :sessions
    # use Rack::Flash

  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

end

  get '/' do
    erb :index
  end
end
