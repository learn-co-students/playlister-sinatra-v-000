class ApplicationController < Sinatra::Base

  get '/genres' do
    erb :'/genres/index'
  end
  
end
