class ArtistsController <ApplicationController

    get '/artists' do
      erb :index
    end
end


#setup use ArtistsController in our confi.ru file
