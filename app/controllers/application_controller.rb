class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  # get '/songs' do
  # 
  # end
  # 
  # get '/genres' do
  # 
  # end
  # 
  # get '/artists' do
  # 
  # end
  # 
  # get '/songs/:slug' do
  # 
  # end
  # 
  # get '/genres/:slug' do
  #   
  # end

end
