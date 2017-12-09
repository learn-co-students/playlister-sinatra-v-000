class ArtistsController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  set :session_secret, "my_application_secret"
  set :views, Proc.new { File.join(root, "../views/") }

  get '/artists' do
    @artists = Artist.all
    erb :"/artists/index"
  end

  get '/artists/:slug' do
    # binding.pry
    @artist = Artist.find_by_slug(params[:slug])
    @songs = @artist.songs
    erb :"artists/show"
  end
end
