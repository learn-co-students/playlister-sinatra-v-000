class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/artists' do
    erb :'/artists/index'
  end

  get '/artists/:id' do
    name = params[:slug].gsub("-", " ")
    @artist = Artist.find(name: name)
    erb :"/artists/show"
  end

end