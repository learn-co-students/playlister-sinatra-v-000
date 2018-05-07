class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }
  
  config.autoload_paths += %W(#{config.root}/lib)

  get '/' do
    erb :index
  end
end
