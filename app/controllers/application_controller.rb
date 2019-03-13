class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end

  get '/songs' do
    erb :'/songs/index'
  end

  get '/artists' do
    erb :'/artists/index'
  end

  get '/genres' do
    erb :'/genres/index'
  end

  get '/songs/:slug' do

  end

  get '/artists/:slug' do

  end

  get '/genres/:slug' do

  end

end
