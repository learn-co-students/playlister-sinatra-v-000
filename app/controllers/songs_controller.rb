class SongsController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/songs' do
    @songs = Song.all
    erb :"songs/index"
  end

  get '/songs/:slug' do
    # @slug = params[:slug]
    @song = Song.find_by_slug(params[:slug])
    @genre_id = @song.song_genres[0].genre_id
    erb :"songs/show"
  end
end
