class ArtistsController < ApplicationController
<<<<<<< HEAD

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    binding.pry
    erb :'/artists/show'
  end

=======
  get '/artists' do
    erb :'/artists/index'
  end

  get '/artists/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'/artists/show'
  end
>>>>>>> 19267d145817a0a775bfacdb683856257c6235f7
end
