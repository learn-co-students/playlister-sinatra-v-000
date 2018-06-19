class SongsController < Sinatra::Base

  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])

    erb :"/songs/show"
  end
end
