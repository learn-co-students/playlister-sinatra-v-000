class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
    erb :"/songs/show"
  end

  get '/songs' do
    erb :'/songs/index'
  end

  get '/genres/:slug' do

  end

  get '/genres' do
    erb :'/genres/show'
  end

  get '/artists/:slug' do
    erb :'/artists/show'
  end

  get '/artists' do
    erb :'/artists/index'
  end


end
