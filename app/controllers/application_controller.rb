require 'sinatra/base'
require 'rack-flash'

class ApplicationController < Sinatra::Base
  enable :sessions
  use Rack::Flash
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }


  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :'/genres/show'
  end

  get '/genres' do
    erb :'/genres/index'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'/artists/show'
  end

  get '/artists' do
    erb :'/artists/index'
  end


end
