class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  get '/songs' do
    erb :"/songs/show"
  end

  get '/artists' do
    erb :"/artists/show"
  end

  get '/genres' do
    erb :"/genres/show"
  end
end
