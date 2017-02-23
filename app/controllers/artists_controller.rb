class ArtistsController < Sinatra::Base
set :views, Proc.new { File.join(root, "../views/") }

  get '/artists' do
    @artists = Artist.all
    erb :'artists/index'
  end

end
