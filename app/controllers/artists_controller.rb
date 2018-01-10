class ArtistsController <ApplicationController

    get '/artists' do
      @artists = Artist.all
      erb :index
    end
end


#setup use ArtistsController in our confi.ru file
