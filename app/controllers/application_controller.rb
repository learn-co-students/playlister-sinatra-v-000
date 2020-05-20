class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/songs' do
     erb :index
  end 
  
  get '/songs/:slug' do
    # @song = Song.find_by_slug(params[:name])
    #  erb :index
  end

end