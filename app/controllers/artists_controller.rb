class ArtistsController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/artists/") }

  get '/artists' do
    @artists = Artist.all
    erb :index
  end

  get '/artists/:slug' do 
    @artist = Artist.find_by_slug(params["slug"])
    @songs = @artist.songs.all
    @genres = @artist.genres.all 
    erb :show
  end

end