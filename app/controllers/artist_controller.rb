class ArtistController < Sinatra::Base
  set :views, Proc.new { File.join(root, "../views/artists") }

  get '/artists' do
    erb :index
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :show
  end
end