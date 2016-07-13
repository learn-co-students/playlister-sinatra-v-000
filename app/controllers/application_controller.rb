class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  # sets root as the parent-directory of the current file
  set :root, File.join(File.dirname(__FILE__), '..')
  # sets the view directory correctly
  set :views, Proc.new { File.join(root, "views") }

  get '/' do
    erb :index
  end

end
