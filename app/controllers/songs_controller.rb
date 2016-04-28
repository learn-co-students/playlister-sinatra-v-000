class SongsController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/songs' do
    erb :'/songs/index'
  end

  get '/songs/:slug' do
    erb :'/songs/show'
  end


end
