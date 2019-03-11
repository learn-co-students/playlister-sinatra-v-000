require "rack-flash"
  class SongsController < ApplicationController
  use Rack::Flash

  configure do
    enable :sessions
  end

  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params["slug"])
    erb :'/songs/show'
  end

  get '/songs/new' do
    
  end

end
