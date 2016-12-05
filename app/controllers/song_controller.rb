require "sinatra/base"
require "rack-flash"
require "pry"

class SongController < ApplicationController
  enable :sessions
  use Rack::Flash

  # get '/' do
    
  # end

  get '/songs' do
    binding.pry
    @songs = Song.all
    erb :'/songs/index'
  end
end