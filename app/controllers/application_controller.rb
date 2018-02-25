class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end
<<<<<<< HEAD

=======
>>>>>>> 1f9fad4566e7bea66933d1080285aea037651e86
end
