class GenresController < ApplicationController
<<<<<<< HEAD
    get '/genres' do
        @genres = Genre.all 
        erb :'genres/index'
    end

    get '/genres/:slug' do
        @genre = Genre.find_by_slug(params[:slug])
        erb :'genres/show'
    end
end
=======
  get '/genres' do
    @genres = Genre.all
    erb :'genres/index'
  end

  get '/genres/:slug' do
    @genre = Genre.find_by_slug(params[:slug])
    erb :'genres/show'
  end
end
>>>>>>> 417f5d79e15b00b9c86f6cc7b458806eebf90074
