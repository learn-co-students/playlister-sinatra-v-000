class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "mighty_potato"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end
end
