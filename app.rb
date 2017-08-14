require_relative 'config/environment'

class App < Sinatra::Base

  get '/' do
    erb :index
  end

  get '/songs' do
    erb :'songs/index'
  end

  get '/genres' do
    erb :'genres/index'
  end

  get '/artists' do
    erb :'artists/index'
  end

  get '/songs/new' do

  end

  get '/songs/:slug' do

  end

  get '/artists/:slug' do

  end

  get '/genres/:slug' do

  end

end
