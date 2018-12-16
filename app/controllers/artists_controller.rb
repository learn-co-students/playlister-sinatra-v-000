class ArtistsController < Sinatra::Base

  get '/artists' do
    @artists=Artist.all
    erb :'artists/index'
  end

end
