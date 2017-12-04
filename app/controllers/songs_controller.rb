class SongsController < Sinatra::Base

  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }



  get '/songs' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/:slug' do

    @song = Song.find_by_slug(params[:slug])
    erb :song_show

    # erb :'songs/show' -- This just will not work for some reason and keeps throwing 500 errors on this route.
  end

end
