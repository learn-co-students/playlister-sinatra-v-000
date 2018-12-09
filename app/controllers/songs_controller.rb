class SongsController < ApplicationController
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }


    get '/songs' do
      # binding.pry
      @songs = Song.all
      erb :'songs/index'
    end
  # get '/' do
  #   @songs = LibraryParser.new.call
  # end

end
