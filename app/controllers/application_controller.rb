class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :index
  end




  patch '/songs/:slug' do

    @song = Song.find_by_slug(params[:slug])
    @song.artist = Artist.create(name: params[:artist_naåme])
    @song.genres.clear
    @song.genres << Genre.find_or_create_by(id: params[:genre_id])
    @song.save
    redirect "/songs/#{@song.slug}"
  end
end
