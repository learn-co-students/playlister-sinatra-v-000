require 'rack-flash'
class ArtistsController < ApplicationController
  use Rack::Flash

  get '/artists' do
    @artists=Artist.all
    erb :'/artists/index'
  end

end
