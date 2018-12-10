class SongsController < ApplicationController
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }


    get '/songs' do
      # binding.pry
      @songs = Song.all
      erb :'songs/index'
    end

    get '/songs/:slug' do
      # binding.pry
      slug = params[:slug]
      @song = Song.find_by_slug(slug)
      @genres = Genre.all
      erb :'songs/show'
    end

end
