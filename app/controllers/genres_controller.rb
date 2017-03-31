class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/genres' do
    erb :'/genres/index'
  end

  get '/genres/:id' do
    @genre = Genre.find(params[:id])
    erb :"/genres/show"
  end

end