require 'rack-flash'

class ArtistController < ApplicationController
#  use Rack::Flash

  get '/artist' do
    @artist = Artist.all
   erb :'/artists/index'
 end
end
