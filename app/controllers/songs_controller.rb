require 'rack-flash'

class SongsController < ApplicationController

  use Rack::Session::Cookie
  use Rack::Flash

  get '/songs' do
    erb :'/songs/index'
  end

  get '/songs/new' do
    erb :'/songs/new'
  end


end
