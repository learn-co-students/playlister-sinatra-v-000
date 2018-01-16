class ArtistsController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/artists/") }

  get '/artists' do
    @artists = Artist.all
    erb :index
  end
end