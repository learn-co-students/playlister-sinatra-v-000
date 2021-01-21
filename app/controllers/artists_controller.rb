class ArtistsController < ApplicationController
<<<<<<< HEAD

    use Rack::Flash 

    get '/artists' do
        @artists = Artist.all 
        erb :'artists/index'
    end

    get '/artists/:slug' do
        @artist = Artist.find_by_slug(params[:slug])
        erb :'artists/show'
    end
end
=======
  get '/artists' do
    @artists = Artist.all
    erb :'artists/index'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'artists/show'
  end
end
>>>>>>> 417f5d79e15b00b9c86f6cc7b458806eebf90074
