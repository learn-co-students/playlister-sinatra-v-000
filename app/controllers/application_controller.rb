class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  enable :sessions

  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    @lib = LibraryParser.find_by(name: "LIB")
    erb :index
  end

  post '/' do
    LibraryParser.parse
    lib = LibraryParser.create(name: "LIB")
    redirect '/'
  end
end