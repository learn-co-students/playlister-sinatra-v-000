class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  register Sinatra::Flash

  configure do
    enable :sessions
    # use Rack::Flash
 		set :session_secret, "my_application_secret"
  	set :public_folder, 'public'
  	set :views, 'app/views'
  end
  # set :views, '../app/views'
	# set :views, Proc.new { File.join(root, "templates") }

  get '/' do
    erb :index
  end
end