class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  enable :sessions

  patch '/songs/:slug' do
   song = Song.find_by_slug(params[:slug])
   song.update(params[:song])
   song.artist = Artist.find_or_create_by(name: params[:artist][:name])
   song.save

   redirect to("/songs/#{song.slug}")
  end
end
