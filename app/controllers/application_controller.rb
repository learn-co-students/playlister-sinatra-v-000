
class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }



  get '/' do
    @msg = "database already existed"
    if Song.all.empty?
      LibraryParser.parse
      @msg = "database loaded"
    end
    erb :index
  end

end
