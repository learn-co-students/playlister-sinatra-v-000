require 'rack-flash'

class SongsController < ApplicationController
  use Rack::Flash

  get '/songs' do
    @songs=Song.all
    erb :'/songs/index'
  end

  get '/songs/:slug' do
    @song=Song.find_by_slug(params[:slug])
    puts :slug
    puts @song
    erb :'/songs/show'
  end

end
